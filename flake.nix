{
  description = " ... ";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    opencode = {
      url = "github:anomalyco/opencode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    hjem,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;

    theme = "flexoki-dark";

    globals = import ./globals {inherit theme pkgs;};
    wrapped = import ./wrapped {inherit pkgs globals;};

    mkSystem = hname:
      nixpkgs.lib.nixosSystem {
        modules = [
          ./modules
          ./hosts/${hname}/configuration.nix
          hjem.nixosModules.default
        ];
        specialArgs = {inherit inputs globals wrapped;};
      };
  in {
    nixosConfigurations = {
      kevnet = mkSystem "kevnet";
      rabbit = mkSystem "rabbit";
    };

    packages.x86_64-linux = wrapped // {default = pkgs.writeText "Kevin" "Hi Kevin";};

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        pkgs.alejandra
        pkgs.nixd
      ];
    };
  };
}

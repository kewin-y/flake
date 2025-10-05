{
  description = " ... ";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-config = {
      url = "github:kewin-y/nvim-kewin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    stylix,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs = nixpkgs.legacyPackages.${system};

    myModules = builtins.attrValues (import ./modules);

    mkSystem = hname:
      nixpkgs.lib.nixosSystem {
        modules =
          [
            ./hosts/${hname}/configuration.nix
            ./system/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.users.kevin = {
                imports = [./home] ++ myModules;
              };
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }
          ]
          ++ myModules;
        specialArgs = {inherit inputs;};
      };
  in {
    nixosConfigurations = {
      keven = mkSystem "keven";
      kevnet = mkSystem "kevnet";
    };
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        nixd
      ];
      shellHook = ''
        export SHELL='${pkgs.mksh}/bin/mksh'
      '';
    };
  };
}

{
  description = " ... ";

  inputs = {
    # Unstable
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # 24.05 (Need for nix-on-droid)
    nixpkgs-other.url = "github:NixOS/nixpkgs/nixos-24.05";

    nvim-config.url = "github:kewin-y/nvim-kewin";
    stylix.url = "github:danth/stylix";

    hm-other = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-other";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-other";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nix-on-droid,
    hm-other,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      keven = lib.nixosSystem {
        system = system;
        modules = [./hosts/keven/configuration.nix];
        specialArgs = {inherit inputs;};
      };
      kevnet = lib.nixosSystem {
        system = system;
        modules = [./hosts/kevnet/configuration.nix];
        specialArgs = {inherit inputs;};
      };
    };
    homeConfigurations = {
      kevin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [stylix.homeManagerModules.stylix ./home.nix];
      };
    };

    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        modules = [./droid];
        pkgs = import nixpkgs-other {
            inherit system;
            overlays = [
                nix-on-droid.overlays.default
            ];
        };
        home-manager-path = hm-other.outPath;
    };
  };
}

{
  description = "here be dragons";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";

    nixvim-config.url = "git+https://codeberg.org/ykevin_u/nixvim.git";

    ags.url = "github:Aylur/ags/v2";

    stylix.url = "github:danth/stylix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
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
  };
}

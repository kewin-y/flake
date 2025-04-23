{
  description = " ... ";

  inputs = {
    # Unstable
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

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

  outputs = { flake-parts, ... } @ inputs:
        flake-parts.lib.mkFlake {inherit inputs;} {
            systems = ["x86_64-linux" "aarch64-linux" ];
          imports = [./flake/hosts.nix ./flake/devshell.nix];
          };
 #  {
 #    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
 #        modules = [./droid];
 #        extraSpecialArgs = { inherit inputs; };
 #        pkgs = import nixpkgs-other {
 #        system = "aarch64-linux";
 #            overlays = [
 #                nix-on-droid.overlays.default
 #            ];
 #        };
 #        home-manager-path = hm-other.outPath;
 #    };
 #  };
}

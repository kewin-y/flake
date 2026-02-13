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
        hjem = {
            url = "github:feel-co/hjem";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        nixpkgs,
        stylix,
        home-manager,
        hjem,
        ...
    } @ inputs: let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        globals = import ./globals {theme = "flexoki";};

        mkSystem = hname: sysVer:
            nixpkgs.lib.nixosSystem {
                modules = [
                    ./modules
                    ./hosts/${hname}/configuration.nix
                    ./config/default.nix
                    hjem.nixosModules.default
                    stylix.nixosModules.stylix

                    # Holy shit I hate home manager
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.users.kevin = {
                            imports = [./home];
                        };
                        home-manager.extraSpecialArgs = {
                            inherit inputs sysVer;
                        };
                    }
                ];
                specialArgs = {inherit inputs sysVer globals;};
            };
    in {
        nixosConfigurations = {
            kevnet = mkSystem "kevnet" "23.11";
            rabbit = mkSystem "rabbit" "25.05";
        };

        devShells.x86_64-linux.default = pkgs.mkShell {
            packages = [
                pkgs.alejandra
                pkgs.nixd
            ];
            shellHook = ''
                export SHELL='${pkgs.mksh}/bin/mksh'
            '';
        };
    };
}

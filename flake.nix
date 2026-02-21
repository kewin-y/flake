{
    description = " ... ";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nvim-config = {
            url = "github:kewin-y/nvim-kewin";
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
        hjem,
        ...
    } @ inputs: let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        theme = "flexoki";

        globals = import ./globals {inherit theme pkgs;};

        mkSystem = hname: sysVer:
            nixpkgs.lib.nixosSystem {
                modules = [
                    ./modules
                    ./hosts/${hname}/configuration.nix
                    ./config/default.nix
                    hjem.nixosModules.default
                ];
                specialArgs = {inherit inputs sysVer globals;};
            };
    in {
        nixosConfigurations = {
            kevnet = mkSystem "kevnet" "23.11";
            rabbit = mkSystem "rabbit" "25.05";
        };

        packages.x86_64-linux.debug-swaylock = import ./config/programs/wrapped/swaylock {
            inherit pkgs;
            base16SchemeNoHashtag = globals.base16SchemeNoHashtag;
        };

        packages.x86_64-linux.debug-waybar = import ./config/programs/wrapped/waybar {
            inherit pkgs;
            base16Scheme= globals.base16Scheme;
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

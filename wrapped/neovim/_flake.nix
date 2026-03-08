{
    description = "kevin's neovim config";

    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = inputs @ {flake-parts, ...}:
        flake-parts.lib.mkFlake {inherit inputs;} {
            systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
            perSystem = {pkgs, ...}: let
                runtimeDeps = [
                    pkgs.gcc
                    pkgs.tree-sitter

                    # needed for fzf
                    pkgs.fzf
                    pkgs.ripgrep

                    # needed for blink
                    pkgs.curl
                    pkgs.git

                    # for my notes
                    pkgs.prettierd
                    pkgs.typstyle
                    pkgs.tinymist
                    pkgs.websocat

                    pkgs.lua-language-server
                    pkgs.stylua
                ];
                nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
                    pkgs.neovimUtils.makeNeovimConfig {
                        customRC = ''
                            set runtimepath^=${./.}
                            lua << EOF
                              local config_path = "${./.}/lua"
                              package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path
                              _G.theme = "decaf"
                              dofile("${./.}/init.lua")
                            EOF
                        '';
                    }
                    // {
                        wrapperArgs = [
                            "--prefix"
                            "PATH"
                            ":"
                            "${pkgs.lib.makeBinPath runtimeDeps}"
                        ];
                    }
                );
            in {
                packages = rec {
                    default = nvim;
                    neovim = default;
                };

                devShells.default = pkgs.mkShell {
                    packages = with pkgs; [
                        nixd
                        alejandra
                    ];

                    shellHook = ''
                        export SHELL='${pkgs.mksh}/bin/mksh'
                    '';
                };
            };
        };
}

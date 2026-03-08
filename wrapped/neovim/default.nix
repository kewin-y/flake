{
    base16Scheme,
    pkgs,
}: let
    runtimeDeps = [
        # tree-sitter
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
        pkgs.alejandra
        pkgs.nixd
    ];
in
    pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
        pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
                set runtimepath^=${./.}
                lua << EOF
                  local config_path = "${./.}/lua"
                  package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path

                  _G.theme = {
                    base00 = "${base16Scheme.base00}",
                    base01 = "${base16Scheme.base01}",
                    base02 = "${base16Scheme.base02}",
                    base03 = "${base16Scheme.base03}",
                    base04 = "${base16Scheme.base04}",
                    base05 = "${base16Scheme.base05}",
                    base06 = "${base16Scheme.base06}",
                    base07 = "${base16Scheme.base07}",
                    base08 = "${base16Scheme.base08}",
                    base09 = "${base16Scheme.base09}",
                    base0A = "${base16Scheme.base0A}",
                    base0B = "${base16Scheme.base0B}",
                    base0C = "${base16Scheme.base0C}",
                    base0D = "${base16Scheme.base0D}",
                    base0E = "${base16Scheme.base0E}",
                    base0F = "${base16Scheme.base0F}",
                  }

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
    )

{pkgs}: let
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

        pkgs.ruff
        pkgs.basedpyright

    ];
in
    pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
        pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
                set runtimepath^=${./.}
                lua << EOF
                  local config_path = "${./.}/lua"
                  package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path
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

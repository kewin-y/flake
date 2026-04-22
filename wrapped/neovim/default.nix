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
    pkgs.ty
  ];
in
  pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
    luaRcContent = ''
      _G.config_dir = "${./.}"
      vim.opt.rtp:prepend("${./.}")
      local config_path = "${./.}/lua"
      dofile("${./.}/init.lua")
    '';

    wrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${pkgs.lib.makeBinPath runtimeDeps}"
    ];
  }

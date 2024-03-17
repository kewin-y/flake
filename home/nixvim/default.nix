{pkgs, ...}: {
  # Startup time is ZERO CONCERN
  home.packages = with pkgs; [
    ripgrep
    wl-clipboard
  ];

  imports = [
    ./config/binds.nix
    ./config/opts.nix
    ./config/nvim-tree.nix
    ./config/telescope.nix
    ./config/treesitter.nix
    ./config/colorizer.nix
    ./config/staline.nix
    ./config/indent-blankline.nix
    ./config/harpoon.nix
    ./config/lsp.nix
    ./config/none-ls.nix
    ./config/cmp.nix
    ./config/luasnip.nix
    ./config/lspkind.nix
  ];

  programs.nixvim.enable = true;
}

{...}: {
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    settings = {
      cmp = true;
      illuminate = true;
      indentblankline = true;
      lsp_semantic = true;
      mini_completion = true;
      telescope = true;
      telescope_borders = false;
    };
  };
}

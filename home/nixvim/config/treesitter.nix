{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };
    nixGrammars = true;
    nixvimInjections = true;
  };
}

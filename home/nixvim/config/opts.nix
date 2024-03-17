{config, ...}: {
  programs.nixvim = {
    options = {
      fillchars.eob = " ";
      termguicolors = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      laststatus = 3;
      showmode = false;
      smartcase = true;
      mouse = "a";
      number = true;
      numberwidth = 2;
      ruler = false;
      relativenumber = true;
      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      timeoutlen = 400;
      undofile = true;
    };

    highlight = {
      WinSeparator.fg = "#${config.lib.stylix.colors.base02}";
    };

    extraConfigLua = ''
      vim.opt.shortmess:append "sI"
      vim.opt.whichwrap:append "<>[]hl"
    '';
  };
}

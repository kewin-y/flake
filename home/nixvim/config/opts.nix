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
      conceallevel = 1;
    };

    # Referenced from: https://github.com/Manas140/Conscious/blob/main/lua/colors.lua
    highlight = {
      WinSeparator.fg = "#${config.lib.stylix.colors.base02}";

      NormalFloat.bg = "#${config.lib.stylix.colors.base01}";
      FloatBorder = {
        fg = "#${config.lib.stylix.colors.base01}";
        bg = "#${config.lib.stylix.colors.base01}";
      };

      NvimTreeWindowPicker = {
        fg = "#${config.lib.stylix.colors.base05}";
        bg = "#${config.lib.stylix.colors.base01}";
      };

      CmpItemAbbrMatch.fg = "#${config.lib.stylix.colors.base05}";
      CmpItemAbbrMatchFuzzy.fg = "#${config.lib.stylix.colors.base05}";
      CmpItemAbbr.fg = "#${config.lib.stylix.colors.base05}";
      CmpItemKind.fg = "#${config.lib.stylix.colors.base0E}";
      CmpItemMenu.fg = "#${config.lib.stylix.colors.base0E}";
      CmpItemKindSnippet.fg = "#${config.lib.stylix.colors.base0E}";

      TelescopePromptBorder = {
        fg = "#${config.lib.stylix.colors.base01}";
        bg = "#${config.lib.stylix.colors.base01}";
      };
      TelescopePromptNormal.bg = "#${config.lib.stylix.colors.base01}";
      TelescopePromptPrefix = {
        fg = "#${config.lib.stylix.colors.base08}";
        bg = "#${config.lib.stylix.colors.base01}";
      };
      TelescopeSelection.bg = "#${config.lib.stylix.colors.base01}";
    };

    extraConfigLua = ''
      vim.opt.shortmess:append "sI"
      vim.opt.whichwrap:append "<>[]hl"
    '';
  };
}

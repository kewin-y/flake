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
    highlight = with config.lib.stylix.colors; {
      WinSeparator.fg = "#${base02}";

      NormalFloat.bg = "#${base01}";
      FloatBorder = {
        fg = "#${base01}";
        bg = "#${base01}";
      };

      NvimTreeWindowPicker = {
        fg = "#${base05}";
        bg = "#${base01}";
      };

      CmpItemAbbrMatch.fg = "#${base05}";
      CmpItemAbbrMatchFuzzy.fg = "#${base05}";
      CmpItemAbbr.fg = "#${base05}";
      CmpItemKind.fg = "#${base0E}";
      CmpItemMenu.fg = "#${base0E}";
      CmpItemKindSnippet.fg = "#${base0E}";

      TelescopePromptBorder = {
        fg = "#${base01}";
        bg = "#${base01}";
      };
      TelescopePromptNormal.bg = "#${base01}";
      TelescopePromptPrefix = {
        fg = "#${base08}";
        bg = "#${base01}";
      };
      TelescopeSelection.bg = "#${base01}";
    };

    extraConfigLua = ''
      vim.opt.shortmess:append "sI"
      vim.opt.whichwrap:append "<>[]hl"
    '';
  };
}

{ pkgs, config, lib, ... }:

{
	programs.nixvim = {
		options = {
			fillchars.eob = " ";
			termguicolors = true;
			number = true;
			relativenumber = true;
			shiftwidth = 2;
			smartindent = true;
			tabstop = 2;
		};

		highlight = {
			WinSeparator.fg = "#${config.lib.stylix.colors.base02}";
		};
	};
}

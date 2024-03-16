{ pkgs, config, ... }:

{
	programs.nixvim.plugins.lualine = {
		enable = false;
		globalstatus = true;
		theme = "base16";
		componentSeparators = {
			left = "";
			right = " ";
		};
		sectionSeparators = {
			left = "";
			right = "";
		};
		sections  = {
			lualine_a = [ "mode" ];
			lualine_b = [ 
				{
					name = "branch"; 
					separator = {
						left = "";
						right = "";
					};
				}

				{
					name = 	"diff";
					separator = {
						left = "";
						right = "";
					};
				}

				{
					name = 	"diagnostics";
					separator = {
						left = "";
						right = "";
					};
				}
			];
			lualine_c = [ "filename" ];
			lualine_x = [ "filetype" ];
			lualine_y = [ "progress" ];
			lualine_z = [ "location" ];
		};
	};
}

{ pkgs, config, ... }:

{
	programs.nixvim = {
		extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
			name = "staline";
			src = pkgs.fetchFromGitHub {
					owner = "tamton-aquib";
					repo = "staline.nvim";
					rev = "c49f2deaba3d3c669e7243b57619e0078e7a351b";
					hash = "sha256-03w3TTzIwZOPSlJNxVQknInW/EIDGiI8WrfEX325dbQ=";
			};
		})];
		extraConfigLua = ''
			require "staline".setup {
				sections = {
					left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp', ' ', 'lsp_name'},
					mid = {},
					right = {'file_name', 'line_column' }
				},
				mode_colors = {
					i = "#${config.lib.stylix.colors.base0F}",
					n = "#${config.lib.stylix.colors.base0D}",
					c = "#${config.lib.stylix.colors.base0B}",
					v = "#${config.lib.stylix.colors.base0E}",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = " "
				}
			}
		'';
	};
}

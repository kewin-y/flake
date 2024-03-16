{ pkgs, config, ... }:
{
	programs.nixvim = {
		extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "hl-chunk";
    src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
				rev = "882d1bc86d459fa8884398223c841fd09ea61b6b";
				hash = "sha256-fvFvV7KAOo7xtOCjhGS5bDUzwd10DndAKs3++dunED8=";
    };
		})];
		extraConfigLua = ''
			require("hlchunk").setup({
				chunk = {
					chars = {
						horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "─",
					},
					style = {
						{ fg = "#${config.lib.stylix.colors.base0B}" },
						{ fg = "#${config.lib.stylix.colors.base0E}" },
					},
				},
				line_num = {
					style = "#${config.lib.stylix.colors.base0B}",
				},
				blank ={
					enable = false,
				}
			})
		'';
	};
}




{ pkgs, config, ... }: 

{
		programs.nixvim.plugins.telescope = {
				enable = true;
				keymaps = {
					"<C-p>" = {
						action = "git_files";
						desc = "Telescope Git Files";
					};
					"<leader>fw" = "live_grep";
					"<leader>ff" = "find_files";
					"<leader>fo" = "oldfiles";
					"<leader>fb" = "buffers";
				};
		};
}

{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ripgrep
	];

	imports = [
		./config/binds.nix
		./config/opts.nix
		./config/lualine.nix
		./config/nvim-tree.nix
		./config/telescope.nix
		./config/treesitter.nix
		./config/hlchunk.nix
		./config/colorizer.nix
		./config/staline.nix
	];

	programs.nixvim.enable = true;
}

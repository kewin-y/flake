{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ripgrep
	];

	imports = [
		./config/binds.nix
		./config/opts.nix
		./config/nvim-tree.nix
		./config/telescope.nix
		./config/treesitter.nix
		./config/colorizer.nix
		./config/staline.nix
    ./config/indent-blankline.nix
    ./config/harpoon.nix
	];

	programs.nixvim.enable = true;
}

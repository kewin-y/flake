{ pkgs, ... }:

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
    ./config/lsp.nix
    ./config/cmp.nix
    ./config/none-ls.nix
	];

	programs.nixvim.enable = true;
}

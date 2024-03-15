{ pkgs, config, lib, ... }:

{
	imports = [
		./binds.nix
		./opts.nix
		./lualine.nix
		./nvim-tree.nix
		./telescope.nix
		./treesitter.nix
		./hlchunk.nix
	];
}

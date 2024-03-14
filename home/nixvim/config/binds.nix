{ config, pkgs, lib, ... }:

{
	programs.nixvim = {
		globals.mapleader = " ";
		keymaps = [
			{
				mode = "n";
				key = "<leader>w";
				action = "<cmd>NvimTreeToggle<CR>";
			}
		];
	};
}

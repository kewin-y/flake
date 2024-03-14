{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		ripgrep
	];

	imports = [
		./config
	];

	programs.nixvim.enable = true;
}

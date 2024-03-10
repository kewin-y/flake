{ config, lib, pkgs, ... }: 

{
	stylix = {
		image = ../../wallpapers/accordion.jpg;
		base16Scheme = ./meut.yaml;
		polarity = "dark";
		cursor = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 20;
		};

		targets = {
			hyprland.enable = false;
			foot.enable = false;
		};
	};

}

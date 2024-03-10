{ config, pkgs, ... }:

{
  imports = [ 
    ./home
  ];
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
  	firefox-bin
	xfce.thunar
	neofetch
	gh
  ];

  home.sessionVariables = {
    # EDITOR = "peemacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

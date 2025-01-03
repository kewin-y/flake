{pkgs, ...}: {
  imports = [
    ./home
  ];

  home = {
    username = "kevin";
    homeDirectory = "/home/kevin";
    stateVersion = "23.11"; # Please read the comment before changing.
    packages = with pkgs; [
      nemo-with-extensions
      swayimg
      mpv
      htop
      obsidian
      vesktop
      pavucontrol
      obs-studio
      killall
    ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };


  wallpaper = ./wallpapers/leaving-breeze.jpg;
  theme = "yoru";
  themeVariant = "dark";

  programs.btop.enable = true;
  programs.home-manager.enable = true;
}

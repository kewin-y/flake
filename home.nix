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


  wallpaper = ./wallpapers/wallhaven-6o9g8l.jpg;
  theme = "test";
  themeVariant = "light";

  programs.btop.enable = true;
  programs.home-manager.enable = true;
}

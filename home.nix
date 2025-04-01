{pkgs, ...}: {
  imports = [
    ./home
  ];

  home = {
    username = "kevin";
    homeDirectory = "/home/kevin";

    # NOTE: Do not change
    stateVersion = "23.11";

    packages = with pkgs; [
      nemo-with-extensions
      swayimg
      mpv
      htop
      obsidian
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


  wallpaper = ./wallpapers/wallhaven-4oem1l.jpg;
  theme = "test";
  themeVariant = "light";

  programs.btop.enable = true;
  programs.home-manager.enable = true;
}

{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git
    ./syncthing
    ./neovim
    ./stylix
  ];

  theme.stylix = {
    polarity = "dark";
    themeName = "cyberdream";
  };

  virtualisation.docker.enable = true;

  environment.shells = [pkgs.mksh];
  users.defaultUserShell = pkgs.mksh;

  environment.systemPackages = lib.attrValues {
    inherit
      (pkgs)
      wget
      curl
      git
      pamixer
      libnotify
      wl-clipboard
      ripgrep
      fastfetch
      unzip
      killall
      nautilus
      swayimg
      mpv
      htop
      obsidian
      pavucontrol
      obs-studio
      rnote
      typst
      ;
  };
}

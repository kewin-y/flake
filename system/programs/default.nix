{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git
    ./syncthing
    ./neovim
  ];

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

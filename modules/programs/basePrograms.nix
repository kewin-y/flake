{
  pkgs,
  lib,
  wrapped,
  ...
}: {
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
  environment.systemPackages =
    lib.attrValues {
      inherit
        (pkgs)
        htop
        btop
        wget
        curl
        git
        libnotify
        pamixer
        ripgrep
        fastfetch
        unzip
        killall
        swayimg
        mpv
        pavucontrol
        obs-studio
        rnote
        vesktop
        sioyek
        inkscape
        imv
        libreoffice
        tree
        chromium
        obsidian
        keepassxc
        ;
      inherit
        (pkgs.kdePackages)
        kdenlive
        ;
    }
    ++ lib.attrValues wrapped;
}

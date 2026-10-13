{
  pkgs,
  lib,
  wrapped,
  ...
}: {
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
        steam-run
        dpkg
        melonds
        ;
      inherit
        (pkgs.kdePackages)
        kdenlive
        ;
    }
    ++ lib.attrValues wrapped;
}

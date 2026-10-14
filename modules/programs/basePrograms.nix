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
        webcord
        sioyek
        inkscape
        imv
        libreoffice
        tree
        chromium
        obsidian
        keepassxc
        dpkg
        melonds
        ;
      inherit
        (pkgs.kdePackages)
        kdenlive
        ;
    }
    ++ lib.attrValues wrapped
    ++ [
      ((pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            nspr
            nss
            at-spi2-atk
            gtk3
            libxcomposite
          ];
      }).run-free)
    ];
}

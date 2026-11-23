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
        wget
        curl
        htop
        btop
        unzip
        killall
        pavucontrol
        fastfetch
        swayimg
        mpv
        obs-studio
        webcord
        sioyek
        inkscape
        libreoffice
        tree
        chromium
        obsidian
        keepassxc
        melonds
        anki
        ripgrep
        # whatever
        dpkg
        desktop-file-utils
        libnotify
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

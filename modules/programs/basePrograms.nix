{
  pkgs,
  lib,
  wrapped,
  ...
}: {
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-40.10.5"
  # ];
  nixpkgs.overlays = [
    (final: prev: {
      linux-firmware = prev.linux-firmware.overrideAttrs (_: {
        version = "20260810";
        src = final.fetchFromGitLab {
          owner = "kernel-firmware";
          repo = "linux-firmware";
          tag = "20260810";
          hash = "sha256-P/fPpqaatp8Z2GV+I/OChiWGn6AhV+8w1RMFuX/LqHc=";
        };
      });
    })
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
        steam-run
        ;
      inherit
        (pkgs.kdePackages)
        kdenlive
        ;
    }
    ++ lib.attrValues wrapped;
}

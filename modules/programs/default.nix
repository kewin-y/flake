{
  pkgs,
  lib,
  wrapped,
  ...
}: {
  imports = [
    ./gui.nix
    ./niri.nix
    ./hjem.nix
    ./obsidian.nix
    ./docker.nix
    ./git.nix
    ./ssh.nix
    ./syncthing.nix
    ./xdg.nix
    ./zsh.nix
    ./zen.nix
    ./development.nix
    ./cliphist.nix
  ];


  # Needed for Nautilus Trash
  services.gvfs.enable = true;

  environment.systemPackages =
    lib.attrValues {
      inherit
        (pkgs)
        wget
        curl
        git
        pamixer
        libnotify
        ripgrep
        fastfetch
        unzip
        killall
        nautilus
        swayimg
        mpv
        htop
        pavucontrol
        obs-studio
        rnote
        zoom-us
        vesktop
        pnpm
        zathura
        inkscape
        imv
        libreoffice
        tree
        chromium
        ;
    }
    ++ lib.attrValues wrapped;
}

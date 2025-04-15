{ config, lib, pkgs, inputs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
      inputs.nvim-config.packages.${pkgs.system}.default
      openssh
    procps
    ncurses
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    curl
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  android-integration.termux-setup-storage.enable = true;

android-integration.termux-reload-settings.enable=true;

terminal.font = "${pkgs.nerdfonts.override {fonts = ["RobotoMono"];}}/share/fonts/truetype/NerdFonts/RobotoMonoNerdFont-Regular.ttf";

  # Set your time zone
  time.timeZone = "America/Toronto";
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}

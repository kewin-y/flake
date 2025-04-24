{
  pkgs,
  inputs,
  ...
}: {
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

  android-integration.termux-reload-settings.enable = true;

  terminal.font = let
    fontPath = "/share/fonts/truetype/NerdFonts/RobotoMonoNerdFont-Regular.ttf";
  in "${pkgs.nerdfonts.override {fonts = ["RobotoMono"];}}${fontPath}";

  # Set your time zone
  time.timeZone = "America/Toronto";

  home-manager = {
    config = ../../home/droid;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}

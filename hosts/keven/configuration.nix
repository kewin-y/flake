{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "keven";

  hardware.brillo.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment? no
}

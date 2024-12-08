{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "keven";

  system.stateVersion = "23.11"; # Did you read the comment?
}

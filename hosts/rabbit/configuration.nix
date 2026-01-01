{sysVer, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rabbit";

  hardware = {
    brillo.enable = true;
    # bluetooth = {
    #   enable = true;
    #   powerOnBoot = true;
    # };
  };

  services.blueman.enable = true;

  system.stateVersion = sysVer;
}

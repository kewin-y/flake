{pkgs, sysVer, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nm-applet.enable = true;

  networking = {
    hostName = "keven";
    networkmanager.wifi.powersave = false;
  };

  hardware = {
    brillo.enable = true;

    enableAllFirmware = true;
    firmware = [pkgs.linux-firmware];
  };

  services.blueman.enable = true;

  system.stateVersion = sysVer;
}

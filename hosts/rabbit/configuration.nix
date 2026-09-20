{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "rabbit";

  kevin = {
    laptop.enable = true;
    network.blocking = {
      enable = false;
    };
    bootloader = "systemd-boot";
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024; # 16 GiB
    }
  ];

  system.stateVersion = "25.05";
}

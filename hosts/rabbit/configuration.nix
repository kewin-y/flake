{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "rabbit";

  kevin = {
    laptop.enable = true;
    network.blocking = {
      enable = false;
      extraHosts = ["reddit.com" "www.reddit.com"];
    };
    bootloader = "systemd-boot";
  };

  system.stateVersion = "25.05";
}

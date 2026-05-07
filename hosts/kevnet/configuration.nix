{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "kevnet";
  kevin = {
    laptop.enable = false;
    network.blocking = {
      enable = true;
    };
    bootloader = "lanzaboote";
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];

  systemd.tpm2.enable = false;
  boot.initrd.systemd.tpm2.enable = false;
  system.stateVersion = "23.11";
}

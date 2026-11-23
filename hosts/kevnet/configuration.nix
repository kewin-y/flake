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
    gui.color-theme = "light";
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];

  systemd.tpm2.enable = false;
  boot.initrd.systemd.tpm2.enable = false;

  # Don't change
  system.stateVersion = "23.11";
}

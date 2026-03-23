{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "kevnet";
  kevin = {
    laptop.enable = false;
    network.blocking = {
      enable = false;
    };
  };

  systemd.tpm2.enable = false;
  system.stateVersion = "23.11";
}

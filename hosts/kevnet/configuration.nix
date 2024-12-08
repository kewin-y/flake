{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "kevnet";

  hardware.ckb-next.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}

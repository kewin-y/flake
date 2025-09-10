{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared
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

  systemd.tpm2.enable = false;

  networking.hostName = "kevnet";

  hardware.ckb-next.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?

  environment.systemPackages =  [
    pkgs.ntfs3g
  ];
}

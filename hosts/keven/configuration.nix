{...}: {
  imports = [
    ./hardware-configuration.nix
    ../shared
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nm-applet.enable = true;

  networking = {
    hostName = "keven";
    networkmanager.wifi.powersave = true;
  };

  hardware = {
    brillo.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.blueman.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment? no
}

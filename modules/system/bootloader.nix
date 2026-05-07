{
  config,
  lib,
  ...
}: {
  options.kevin = {
    bootloader = lib.mkOption {
      default = "systemd-boot";
      type = lib.types.enum ["grub" "systemd-boot" "lanzaboote"];
    };
  };
  config = let
    cfg = config.kevin.bootloader;
  in {
    boot = lib.mkMerge [
      {loader.efi.canTouchEfiVariables = true;}

      (lib.mkIf (cfg == "grub") {
        loader.grub = {
          enable = true;
          devices = ["nodev"];
          efiSupport = true;
          useOSProber = true;
        };
      })

      (lib.mkIf (cfg == "systemd-boot") {
        loader.systemd-boot = {
          enable = true;
          configurationLimit = 5;
        };
      })

      (lib.mkIf (cfg == "lanzaboote") {
        loader.systemd-boot.enable = lib.mkForce false;
        lanzaboote = {
          enable = true;
          pkiBundle = "/var/lib/sbctl";
        };
      })
    ];
  };
}

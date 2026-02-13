{
    config,
    lib,
    ...
}: {
    options.kevin = {
        bootloader = lib.mkOption {
            default = "systemd-boot";
            type = lib.types.enum ["grub" "systemd-boot"];
        };
    };
    config = let
        cfg = config.kevin.bootloader;
    in {
        boot.loader = lib.mkMerge [
            {efi.canTouchEfiVariables = true;}

            (lib.mkIf (cfg == "grub") {
                grub = {
                    enable = true;
                    devices = ["nodev"];
                    efiSupport = true;
                    useOSProber = true;
                };
            })

            (lib.mkIf (cfg == "systemd-boot") {
                systemd-boot.enable = true;
            })
        ];
    };
}

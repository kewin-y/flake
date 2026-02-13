{
    lib,
    config,
    ...
}: {
    options.kevin = {
        laptop.enable = lib.mkEnableOption "laptop-specific configuration";
    };
    config = let
        cfg = config.kevin.laptop;
    in
        lib.mkIf cfg.enable {
            services.upower.enable = true;
            services.blueman.enable = true;
            hardware = {
                bluetooth = {
                    enable = true;
                    powerOnBoot = true;
                };
                brillo.enable = true;
            };
        };
}

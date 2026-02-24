{
    lib,
    config,
    ...
}: {
    options.kevin = {
        network = {
            blocking.enable = lib.mkEnableOption "network blocking";
        };
    };

    config = let
        cfg = config.kevin.network;
    in
        lib.mkMerge [
            {
                networking.networkmanager.enable = true;
            }
            (lib.mkIf cfg.blocking.enable {
                networking = {
                    stevenblack = {
                        enable = true;
                        block = [
                            "fakenews"
                            "social"
                        ];
                    };

                    extraHosts = ''
                        0.0.0.0 youtube.com
                        0.0.0.0 www.youtube.com
                    '';
                };
            })
        ];
}

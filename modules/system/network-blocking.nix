{
    lib,
    config,
    ...
}: {
    options.kevin = {
        networkBlocking.enable = lib.mkEnableOption "network blocking";
    };

    config = let
        cfg = config.kevin.networkBlocking;
    in
        lib.mkIf cfg.enable {
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
        };
}

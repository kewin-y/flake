{
  lib,
  config,
  ...
}: {
  options.kevin = {
    network = {
      blocking.enable = lib.mkEnableOption "network blocking";
      blocking.extraHosts = lib.mkOption {
        default = [];
        type = lib.types.listOf lib.types.str;
      };
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
          extraHosts = let
            allHosts =
              [
                # Anything that makes me unproductive
                "mangakatana.com"
                "mangadex.org"

                # I hate music
                "open.spotify.com"
                "soundcloud.com"
                "rateyourmusic.com"
                "aoty.org"
                "albumoftheyear.org"
              ]
              ++ cfg.blocking.extraHosts;
          in
            lib.pipe allHosts [
              (map (host: "0.0.0.0 " + host))
              (lib.concatStringsSep "\n")
            ];
        };
      })
    ];
}

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
          extraHosts = lib.pipe cfg.blocking.extraHosts [
            (map (host: "0.0.0.0 " + host))
            (lib.concatStringsSep "\n")
          ];
        };
      })
    ];
}

{lib, ...}: {
  options.kevin = {
    wallpaper = lib.mkOption {
      default = null;
      type = lib.types.nullOr lib.types.path;
    };
  };
}

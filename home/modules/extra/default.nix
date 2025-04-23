{lib, ...}: {
  options = {
    wallpaper = lib.mkOption {
      default = ../../../wallpapers/accordion.png;
      type = lib.types.path;
    };
  };
}

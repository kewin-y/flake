{lib, ...}: {
  options = {
    wallpaper = lib.mkOption {
      default = ../wallpapers/wallhaven-1q3p63.jpg;
      type = lib.types.path;
    };
  };
  config = {
    wallpaper = ../wallpapers/wallhaven-1q3p63.jpg;
  };
}

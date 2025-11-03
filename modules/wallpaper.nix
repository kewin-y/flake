{lib, ...}: {
  options = {
    wallpaper = lib.mkOption {
      default = ../wallpapers/wallhaven-rdr5gj.jpg;
      type = lib.types.path;
    };
  };
  config = {
    wallpaper = ../wallpapers/wallhaven-r7mqk7.jpg;
  };
}

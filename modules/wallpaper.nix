{lib, ...}: {
  options = {
    wallpaper = lib.mkOption {
      default = ../wallpapers/sebastian-svenson-vaC0w7XBSXw-unsplash.jpg;
      type = lib.types.path;
    };
  };
  config = {
    wallpaper = ../wallpapers/sebastian-svenson-vaC0w7XBSXw-unsplash.jpg;
  };
}

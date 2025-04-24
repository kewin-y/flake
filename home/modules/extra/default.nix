{lib, ...}: {
  options = {
    enableGui = lib.mkEnableOption "Enables GUI apps";
    enableWm = lib.mkEnableOption "Enables window manager";
    wallpaper = lib.mkOption {
      default = ../../../wallpapers/accordion.png;
      type = lib.types.path;
    };
  };
}

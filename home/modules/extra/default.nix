{lib, ...}: {
  options = {
    enableGui = lib.mkEnableOption "Enables GUI apps";
    wallpaper = lib.mkOption {
      default = ../../../wallpapers/accordion.png;
      type = lib.types.path;
    };
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [./config];
  home.packages = lib.mkIf config.enableGui (with pkgs; [
    labwc
    swaybg
  ]);
}

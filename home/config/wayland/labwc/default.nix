{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [./config];
  home.packages = with pkgs; [
    labwc
    swaybg
  ];
}

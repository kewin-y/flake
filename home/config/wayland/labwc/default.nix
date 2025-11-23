{pkgs, ...}: {
  imports = [./config];
  home.packages = [
    pkgs.labwc
    pkgs.swaybg
  ];
}

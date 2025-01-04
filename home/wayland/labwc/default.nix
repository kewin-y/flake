{pkgs, ...}: {
  imports = [./config];
  home.packages = with pkgs; [
    labwc
    swaybg
  ];
}

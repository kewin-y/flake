{pkgs, ...}: {
  home.packages = with pkgs; [
    labwc
    swaybg
  ];
}

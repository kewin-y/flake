{pkgs, ...}: {
  home.packages = with pkgs; [
    labwc
  ];
}

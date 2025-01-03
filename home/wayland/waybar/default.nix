{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar
  ];
}

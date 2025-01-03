{pkgs, ...}: {
  home.packages = with pkgs; [
    labwc
    swaybg
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr];
    config = {
      labwc = {
        default = ["wlr" "*"];
      };
    };
  };
}

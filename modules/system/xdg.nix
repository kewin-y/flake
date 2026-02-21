{pkgs, ...}: {
    xdg.portal = {
    config.common.default = "gtk";
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}

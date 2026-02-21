{pkgs, ...}: {
    xdg.portal = {
        config.common.default = "*";
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-gnome
        ];
    };
}

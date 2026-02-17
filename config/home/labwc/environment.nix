{globals, ...}: {
    hjem.users.${globals.user}.files = {
        ".config/labwc/environment".text = ''
            XDG_CURRENT_DESKTOP=labwc
            MOZ_GTK_TITLEBAR_DECORATION=system
            ELECTRON_OZONE_PLATFORM_HINT=wayland
        '';
    };
}

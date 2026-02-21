{globals, ...}: {
    # Let the module configure the portals (for now)
    programs.niri.enable = true;

    hjem.users.${globals.user}.files = {
        ".config/niri/config.kdl".source = ./config.kdl;
    };

}

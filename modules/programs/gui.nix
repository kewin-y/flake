{
    pkgs,
    lib,
    globals,
    ...
}: {
    qt = {
        enable = true;
        style = "breeze";
        platformTheme = "gnome";
    };
    environment.systemPackages = [
        pkgs.kdePackages.breeze-gtk
        pkgs.kdePackages.breeze-icons
        pkgs.quintom-cursor-theme
    ];
    programs.dconf = {
        enable = true;
        profiles.user.databases = [
            {
                lockAll = false;
                settings."org/gnome/desktop/interface" = {
                    color-scheme = lib.gvariant.mkString "prefer-light";
                    gtk-theme = lib.gvariant.mkString "Breeze";
                    icon-theme = lib.gvariant.mkString "breeze";
                    cursor-theme = lib.gvariant.mkString "Quintom_Ink";
                    cursor-size = lib.gvariant.mkInt32 24;
                };
            }
        ];
    };
    hjem.users.${globals.user}.files = {
        ".config/gtk-4.0/settings.ini".text = ''
            [Settings]
            gtk-cursor-theme-name=Quintom_Ink
            gtk-cursor-theme-size=24
            gtk-icon-theme-name=breeze
            gtk-theme-name=Breeze
        '';
        ".config/gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-cursor-theme-name=Quintom_Ink
            gtk-cursor-theme-size=24
            gtk-icon-theme-name=breeze
            gtk-theme-name=Breeze
        '';
        ".config/gtk-2.0/gtkrc".text = ''
            gtk-cursor-theme-name = "Quintom_Ink"
            gtk-cursor-theme-size = 24
            gtk-icon-theme-name="breeze
            gtk-theme-name="BreezeDark"
        '';
    };
}

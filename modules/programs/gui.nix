{
    pkgs,
    lib,
    globals,
    ...
}: {
    qt = {
        enable = true;
        # If you want Qt apps to mimic GTK, keep "gnome".
        # If you want Qt apps to look like adw-gtk3, change to "kde" or remove this line.
        platformTheme = "gnome";
        style = "adwaita";
    };

    environment.systemPackages = [
        pkgs.kdePackages.breeze-gtk
        pkgs.kdePackages.breeze-icons
        pkgs.adw-gtk3
        pkgs.quintom-cursor-theme
    ];

    # Force GTK to use the theme
    environment.sessionVariables.GTK_THEME = "adw-gtk3";

    programs.dconf = {
        enable = true;
        profiles.user.databases = [
            {
                lockAll = false;
                settings."org/gnome/desktop/interface" = {
                    color-scheme = lib.gvariant.mkString "prefer-light";
                    gtk-theme = lib.gvariant.mkString "adw-gtk3";
                    icon-theme = lib.gvariant.mkString "breeze";
                    cursor-theme = lib.gvariant.mkString "Quintom_Snow";
                    cursor-size = lib.gvariant.mkInt32 24;
                };
            }
        ];
    };

    hjem.users.${globals.user}.files = {
        ".config/gtk-4.0/settings.ini".text = ''
            [Settings]
            gtk-cursor-theme-name=Quintom_Snow
            gtk-cursor-theme-size=24
            gtk-icon-theme-name=breeze
            gtk-theme-name=adw-gtk3
        '';
        ".config/gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-cursor-theme-name=Quintom_Snow
            gtk-cursor-theme-size=24
            gtk-icon-theme-name=breeze
            gtk-theme-name=adw-gtk3
        '';
        # Fixed syntax and theme name here
        ".config/gtk-2.0/gtkrc".text = ''
            gtk-cursor-theme-name = "Quintom_Snow"
            gtk-cursor-theme-size = 24
            gtk-icon-theme-name = "breeze"
            gtk-theme-name = "adw-gtk3"
        '';
    };
}

{
    pkgs,
    lib,
    globals,
    config,
    ...
}: let
in {
    options.kevin.gui = {
        icon-theme = lib.mkOption {
            default = "breeze-dark";
            type = lib.types.str;
        };
        cursor-theme = lib.mkOption {
            default = "Quintom_Ink";
            type = lib.types.str;
        };
        color-theme = lib.mkOption {
            default = "dark";
            type = lib.types.enum [
                "dark"
                "light"
            ];
        };
    };
    config = let
        inherit (config.kevin.gui) icon-theme cursor-theme color-theme;
    in {
        qt = {
            enable = true;
            platformTheme = "gnome";
            style = "adwaita";
        };

        environment.systemPackages = [
            pkgs.kdePackages.breeze-gtk
            pkgs.kdePackages.breeze-icons
            pkgs.adw-gtk3
            pkgs.quintom-cursor-theme
        ];

        environment.sessionVariables.GTK_THEME = "adw-gtk3";

        programs.dconf = {
            enable = true;
            profiles.user.databases = [
                {
                    lockAll = false;
                    settings."org/gnome/desktop/interface" = {
                        color-scheme = lib.gvariant.mkString (
                            if color-theme == "dark"
                            then "prefer-dark"
                            else "default"
                        );
                        gtk-theme = lib.gvariant.mkString "adw-gtk3";
                        icon-theme = lib.gvariant.mkString icon-theme;
                        cursor-theme = lib.gvariant.mkString cursor-theme;
                        cursor-size = lib.gvariant.mkInt32 24;
                    };
                }
            ];
        };

        hjem.users.${globals.user}.files = {
            ".config/gtk-4.0/settings.ini".text = ''
                [Settings]
                gtk-cursor-theme-name=${cursor-theme}
                gtk-cursor-theme-size=24
                gtk-icon-theme-name=${icon-theme}
                gtk-theme-name=adw-gtk3
            '';
            ".config/gtk-3.0/settings.ini".text = ''
                [Settings]
                gtk-cursor-theme-name=${cursor-theme}
                gtk-cursor-theme-size=24
                gtk-icon-theme-name=${icon-theme}
                gtk-theme-name=adw-gtk3
            '';
            ".config/gtk-2.0/gtkrc".text = ''
                gtk-cursor-theme-name = "${cursor-theme}"
                gtk-cursor-theme-size = 24
                gtk-icon-theme-name = "${icon-theme}"
                gtk-theme-name = "adw-gtk3"
            '';
        };
    };
}

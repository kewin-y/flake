{
    pkgs,
    config,
    lib,
    globals,
    ...
}: {
    qt = {
        enable = true;
        style = "adwaita-dark";
        platformTheme = "gnome";
    };
    programs.dconf = {
        enable = true;

        profiles.user.databases = [
            {
                lockAll = false;
                settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
            }
        ];
    };
    environment = {
        systemPackages = [
            pkgs.flat-remix-gtk
            pkgs.flat-remix-icon-theme
            pkgs.quintom-cursor-theme
        ];
        etc = let
            text = ''
                [Settings]
                gtk-icon-theme-name=breeze-dark
                gtk-theme-name=BreezeDark
            '';
        in {
            "gtk-3.0/settings.ini" = {inherit text;};
            "gtk-4.0/settings.ini" = {inherit text;};
        };
    };
}

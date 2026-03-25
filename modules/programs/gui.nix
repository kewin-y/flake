{
  pkgs,
  globals,
  lib,
  config,
  ...
}: let
  inherit
    (config.kevin.gui)
    icon-theme
    cursor-theme
    color-theme
    ;

  gtkTheme =
    if color-theme == "dark"
    then "adw-gtk3-dark"
    else "adw-gtk3";
in {
  options.kevin.gui = {
    icon-theme = lib.mkOption {
      type = lib.types.str;
      default = "Tela-light";
    };

    cursor-theme = lib.mkOption {
      type = lib.types.str;
      default = "Quintom_Ink";
    };

    color-theme = lib.mkOption {
      type = lib.types.enum ["dark" "light"];
      default = "light";
    };
  };

  config = {
    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita";
    };

    programs.dconf.enable = true;

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings."org/gnome/desktop/interface" = {
          color-scheme = lib.gvariant.mkString (
            if color-theme == "dark"
            then "prefer-dark"
            else "default"
          );
          gtk-theme = lib.gvariant.mkString gtkTheme;
          icon-theme = lib.gvariant.mkString icon-theme;
          cursor-theme = lib.gvariant.mkString cursor-theme;
          cursor-size = lib.gvariant.mkInt32 24;
        };
      }
    ];

    environment = {
      systemPackages = [
        pkgs.adw-gtk3
        pkgs.morewaita-icon-theme
        pkgs.kdePackages.breeze-icons
        pkgs.quintom-cursor-theme
        pkgs.tela-icon-theme
      ];
      etc = {
        "gtk-4.0/settings.ini".text = ''
          [Settings]
          gtk-theme-name=${gtkTheme}
          gtk-icon-theme-name=${icon-theme}
          gtk-cursor-theme-name=${cursor-theme}
          gtk-cursor-theme-size=24
        '';

        "gtk-3.0/settings.ini".text = ''
          [Settings]
          gtk-theme-name=${gtkTheme}
          gtk-icon-theme-name=${icon-theme}
          gtk-cursor-theme-name=${cursor-theme}
          gtk-cursor-theme-size=24
        '';

        "gtk-2.0/gtkrc".text = ''
          gtk-theme-name = "${gtkTheme}"
          gtk-icon-theme-name = "${icon-theme}"
          gtk-cursor-theme-name = "${cursor-theme}"
          gtk-cursor-theme-size = 24
        '';
      };
    };
  };
}

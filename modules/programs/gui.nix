# 🥹🥹🥹🥹🥹🥹🥹🥹
# I have 1 million things to say to the people who designed these "specs", theming guidelines, adwaita or whatever
# None of them are good
# So much SHENANIGANS to get DARK MODE and the docs SUCK POOP BUTT
# 🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹
# I can't help but generate all of this code using LLM. FUCK YOU.
{
  pkgs,
  lib,
  config,
  base,
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

  qtStyle =
    if color-theme == "dark"
    then "adwaita-dark"
    else "adwaita";

  qtSettings = ''
    [Appearance]
    style=${qtStyle}
    icon_theme=${icon-theme}
    custom_palette=false

    [Fonts]
    general="Sans Serif,10,-1,5,50,0,0,0,0,0"
    fixed="Monospace,12,-1,5,50,0,0,0,0,0"
  '';
in {
  options.kevin.gui = {
    icon-theme = lib.mkOption {
      type = lib.types.str;
      default =
        if color-theme == "dark"
        then "Tela-dark"
        else "Tela";
    };

    cursor-theme = lib.mkOption {
      type = lib.types.str;
      default = "Quintom_Ink";
    };

    color-theme = lib.mkOption {
      type = lib.types.enum ["dark" "light"];
      default = "dark";
      description = ''
        Make a guess
      '';
    };
  };

  config = {
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = qtStyle;
    };

    programs.dconf.enable = true;

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings."org/gnome/desktop/interface" = {
          # 🥹🥹🥹🥹🥹🥹
          color-scheme = lib.gvariant.mkString (
            if color-theme == "dark"
            then "prefer-dark"
            else "prefer-light"
          );
          gtk-theme = lib.gvariant.mkString gtkTheme;
          # Keep portal consumers aligned with the GTK settings.ini font.
          font-name = lib.gvariant.mkString "sans-serif 10";
          icon-theme = lib.gvariant.mkString icon-theme;
          cursor-theme = lib.gvariant.mkString cursor-theme;
          cursor-size = lib.gvariant.mkInt32 24;
        };
      }
    ];

    hjem.users.${base.user}.files = {
      ".config/qt5ct/qt5ct.conf".text = qtSettings;
      ".config/qt6ct/qt6ct.conf".text = qtSettings;

      ".gtkrc-2.0".text = ''
        gtk-icon-theme-name = "${icon-theme}"
        gtk-cursor-theme-name = "${cursor-theme}"
        gtk-cursor-theme-size = 24
          gtk-font-name = "sans-serif 10"
      '';
    };

    environment = {
      systemPackages = [
        pkgs.adw-gtk3
        pkgs.morewaita-icon-theme
        pkgs.kdePackages.breeze-icons
        pkgs.quintom-cursor-theme
        pkgs.tela-icon-theme
      ];
      etc = {
        "xdg/gtk-4.0/settings.ini".text = ''
          [Settings]
          # This is so stupid 🥹🥹🥹🥹🥹🥹🥹
          gtk-application-prefer-dark-theme=${if color-theme == "dark" then "true" else "false"}
          gtk-icon-theme-name=${icon-theme}
          gtk-cursor-theme-name=${cursor-theme}
          gtk-cursor-theme-size=24
          gtk-font-name = sans-serif 10
        '';

        "xdg/gtk-3.0/settings.ini".text = ''
          [Settings]
          gtk-theme-name=${gtkTheme}
          gtk-icon-theme-name=${icon-theme}
          gtk-cursor-theme-name=${cursor-theme}
          gtk-cursor-theme-size=24
          gtk-font-name = sans-serif 10
        '';
      };
    };
  };
}

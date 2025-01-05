{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    theme = lib.mkOption {
      default = "far";
      type = lib.types.enum [
        "far"
        "material-palenight"
        "paradise"
        "rose-pine"
        "rose-pine-dawn"
        "test"
      ];
    };

    wallpaper = lib.mkOption {
      default = ../../wallpapers/accordion.png;
      type = lib.types.path;
    };

    # Or polarity
    themeVariant = lib.mkOption {
      default = "dark";
      type = lib.types.enum [
        "dark"
        "light"
      ];
    };
  };

  config = {
    stylix = {
      enable = true;

      # Placeholder (literally doesn't matter)
      image = config.wallpaper;

      base16Scheme = ./themes/${config.theme}.yaml;
      polarity = config.themeVariant;

      cursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 24;
      };

      targets = {
        neovim.enable = false;
        nixvim.enable = false;
        spicetify.enable = false;
        fzf.enable = false;
        tmux.enable = false;

        waybar.enable = false;
        fuzzel.enable = false;
        mako.enable = false;

        gtk.extraCss = with config.lib.stylix.colors; ''
          @define-color accent_color #${base0D};
          @define-color accent_bg_color #${base0D};

          * {
            border-radius: 0;
          }
        '';
      };

      fonts = {
        sizes = {
          terminal = 10;
          applications = 10;
          desktop = 10;
        };
        monospace = {
          name = "MapleMono NF";
          package = pkgs.maple-mono;
        };
        sansSerif = {
          name = "Rubik";
          package = pkgs.rubik;
        };
      };
    };

    gtk = {
      enable = true;
      iconTheme = {
        name =
          if config.themeVariant == "dark"
          then "Papirus-Dark"
          else "Papirus-Light";
        package = pkgs.papirus-icon-theme.override {color = "blue";};
      };
    };

    qt = {
      enable = true;
    };
  };
}

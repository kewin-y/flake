{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.theme.stylix;
in {
  options = {
    theme = {
      stylix = {
        enable = lib.mkEnableOption "Enable Stylix";
        polarity = lib.mkOption {
          default = "dark";
          type = lib.types.enum [
            "dark"
            "light"
          ];
        };
        themeName = lib.mkOption {
          default = "far";
          type = lib.types.enum [
            "far"
            "material-palenight"
            "paradise"
            "rose-pine"
            "rose-pine-dawn"
            "test"
            "everforest-dark-hard"
          ];
        };
      };
    };
  };

  config = lib.mkIf config.theme.stylix.enable {
    stylix = {
      enable = true;

      # Placeholder (literally doesn't matter)
      image = config.wallpaper;

      base16Scheme = ./themes/${cfg.themeName}.yaml;
      polarity = cfg.polarity;

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

        firefox.profileNames = ["kevin"];

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
          name = "RobotoMono Nerd Font Propo";
          # package = pkgs.nerd-fonts.roboto-mono;
        };
        sansSerif = {
          name = "Rubik";
          package = pkgs.rubik;
        };
      };
    };
  };
}

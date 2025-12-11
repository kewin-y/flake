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
        polarity = lib.mkOption {
          default = "dark";
          type = lib.types.enum [
            "dark"
            "light"
          ];
        };
        themeName = lib.mkOption {
          default = "oxocarbon";
          type = lib.types.enum [
            "decaf"
          ];
        };
      };
    };
  };

  config = {
    stylix = {
      enable = true;

      # config.wallpaper is defined in modules/wallpaper.nix
      image = config.wallpaper;

      base16Scheme = ./themes/${cfg.themeName}.yaml;
      polarity = cfg.polarity;

      cursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 24;
      };

      fonts = {
        sizes = {
          terminal = 12;
          applications = 12;
          desktop = 12;
        };
        monospace = {
          name = "Iosevka NFP";
          package = pkgs.nerd-fonts.iosevka;
        };
        sansSerif = {
          name = "Inter";
          package = pkgs.inter;
        };
      };
    };
  };
}

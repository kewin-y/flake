{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.files.yazi;
in {
  options = {
    files = {
      yazi = {
        enable = lib.mkEnableOption "Enable Yazi";
        enableOpeners = lib.mkEnableOption "Enable Yazi openers";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      settings = {
        opener = lib.mkIf cfg.enableOpeners {
          image = [
            {
              run = ''${pkgs.swayimg}/bin/swayimg "$1"'';
              desc = "View Image";
            }
          ];
          video = [
            {
              run = ''${pkgs.mpv}/bin/mpv "$1"'';
              desc = "Watch Video";
            }
          ];
          audio = [
            {
              run = ''${pkgs.mpv}/bin/mpv "$1"''; # Hmm
              desc = "Listen to Audio";
            }
          ];
          pdf = [
            {
              run = ''${pkgs.zathura}/bin/zathura "$1"''; # Hmm
              desc = "View PDF";
            }
          ];
        };
        open = lib.mkIf cfg.enableOpeners {
          rules = [
            {
              mime = "image/*";
              use = "image";
            }
            {
              mime = "video/*";
              use = "video";
            }
            {
              mime = "audio/*";
              use = "audio";
            }
            {
              mime = "application/pdf";
              use = "pdf";
            }
          ];
        };
      };

      plugins = {
        full-border = "${inputs.yazi-plugins}/full-border.yazi";
      };

      initLua = ''
        require("full-border"):setup {
          type = ui.Border.PLAIN,
        }
      '';

      theme = {
        icon = {
          globs = [];
          dirs = [];
          files = [];
          exts = [];
          conds = [];
        };
        manager = lib.mkIf config.theme.stylix.enable (with config.lib.stylix.colors.withHashtag; rec {
          hovered = lib.mkForce {
            fg = base05;
            bg = base01;
            bold = true;
          };
          preview_hovered = lib.mkForce hovered;
          border_style.fg = lib.mkForce base03;
        });
        status = {
          sep_left = {
            open = "";
            close = "";
          };
          sep_right = {
            open = "";
            close = "";
          };
        };
      };
    };
  };
}

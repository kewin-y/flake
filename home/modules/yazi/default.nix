{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
in {
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
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
      open = {
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
      full-border = pkgs.yaziPlugins.full-border;
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
      manager = with config.lib.stylix.colors.withHashtag; rec {
        hovered = lib.mkForce {
          fg = base05;
          bg = base01;
          bold = true;
        };
        preview_hovered = lib.mkForce hovered;
        border_style.fg = lib.mkForce base03;
      };
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
}

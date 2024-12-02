{
  pkgs,
  config,
  lib,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "a53d5440481f0f9a2160ded47d343bd22ffbc1fb";
    hash = "sha256-I9u1d3l0AyNW/t1A7MAxfA6Wu1/L3XKUoWPZ9L85WTM=";
  };
in {
  # TODO Add bindings for pdfs, text files, etc.
  # I DONT WANNA
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
      full-border = "${yazi-plugins}/full-border.yazi";
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
        separator_open = "";
        separator_close = "";
      };
    };
  };
}

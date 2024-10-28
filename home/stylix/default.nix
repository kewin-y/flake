{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;

    # Placeholder (literally doesn't matter)
    image = config.wallpaper;

    base16Scheme = ./far.yaml;
    polarity = "light";

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    targets = {
      hyprland.enable = false;
      firefox.enable = false;
      fzf.enable = false;
      tmux.enable = false;
      gtk.extraCss = with config.lib.stylix.colors; ''
        @define-color accent_color #${base0D};
        @define-color accent_bg_color #${base0D};
      '';
    };

    fonts = {
      monospace = {
        name = "${config.font}";
        package = pkgs.nerdfonts.override {fonts = ["${config.font}"];};
      };
      sansSerif = {
        name = "lexend";
        package = pkgs.lexend;
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "nordic";};
    };
  };

  qt = {
    enable = true;
  };
}

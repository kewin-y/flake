{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;
    image = ../../wallpapers/wallhaven-exyr1w.jpg;
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
      gtk.extraCss = with config.lib.stylix.colors; ''
        @define-color accent_color #${base0D};
        @define-color accent_bg_color #${base0D};
      '';
    };

    fonts = {
      monospace = {
        name = "ZedMono NF";
        package = pkgs.nerdfonts.override {fonts = ["ZedMono"];};
      };
      sansSerif = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex;
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "bluegrey";};
    };
  };

  qt = { 
    enable = true;
  };
}

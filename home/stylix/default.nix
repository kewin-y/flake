{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;

    # Placeholder (literally doesn't matter)
    image = config.wallpaper;

    base16Scheme = ./themes/oxocarbon.yaml;
    polarity = "dark";

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    targets = {
      hyprland.enable = false;
      nixvim.enable = false;
      neovim.enable = false;
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
        name = "rubik";
        package = pkgs.rubik;
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "blue";};
    };
  };

  qt = {
    enable = true;
  };
}

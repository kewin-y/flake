{config, ...}: {
  stylix.targets = {
    neovim.enable = false;
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
}

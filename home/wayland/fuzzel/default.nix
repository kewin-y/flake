{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "tamzen:size=10";
        horizontal-pad = 18;
        vertical-pad = 18;
        inner-pad = 18;
        dpi-aware = "yes";
        icons-enabled = "no";
        line-height = 20;
      };
      border = {
        radius = 0;
        width = 2;
      };
      colors = with config.lib.stylix.colors.withHashtag; {
        background = "${base00}ff";
        text = "${base05}ff";
        selection-text = "${base05}ff";
        match = "${base0D}ff";
        prompt = "${base0D}ff";
        selection-match = "${base0D}ff";
        selection = "${base01}ff";
        border = "${base01}ff";
      };
    };
  };
}

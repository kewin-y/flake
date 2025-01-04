{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "tamzen:size=10";
        horizontal-pad = 8;
        vertical-pad = 8;
        inner-pad = 8;
        dpi-aware = "yes";
        icons-enabled = "no";
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

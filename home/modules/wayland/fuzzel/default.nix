{
  config,
  lib,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Rubik:size=10";
        horizontal-pad = 18;
        vertical-pad = 18;
        inner-pad = 18;
        dpi-aware = "no";
        icons-enabled = "no";
        line-height = 20;
        lines = 8;
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
        input = "${base05}ff";
        placeholder = "${base03}ff";
        selection-match = "${base0D}ff";
        selection = "${base02}ff";
        border = "${base01}ff";
      };
    };
  };
}

{
  config,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        box-drawings-uses-font-glyphs = "no";
        pad = "24x24";
      };

      tweak = {
        grapheme-width-method="double-width";
      };

      colors.cursor = with config.lib.stylix.colors; "${base00} ${base05}";
    };
  };
}

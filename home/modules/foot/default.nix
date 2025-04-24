{
  config,
  lib,
  ...
}:
lib.mkIf config.enableGui {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        box-drawings-uses-font-glyphs = "no";
        pad = "24x24";
      };

      cursor = with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      };
    };
  };
}

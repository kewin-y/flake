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

      cursor = lib.mkIf config.theme.stylix.enable (with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      });
    };
  };
}

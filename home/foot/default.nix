{
  config,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "${config.font} NFP:style=Regular:size=11";
        font-bold = lib.mkForce "${config.font} NFP:style=Bold:size=11";
        font-italic = lib.mkForce "${config.font} NFP:style=Italic:size=11";
        font-bold-italic = lib.mkForce "${config.font} NFP:style=Bold Italic:size=11";
        box-drawings-uses-font-glyphs = "no";
        pad = "24x24";
      };

      cursor = with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      };
    };
  };
}

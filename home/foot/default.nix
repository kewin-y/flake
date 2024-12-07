{
  config,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Iosevka NFP:style=Regular:size=10.5";
        font-bold = lib.mkForce "Iosevka NFP:style=Bold:size=10.5";
        font-italic = lib.mkForce "Iosevka NFP:style=Italic:size=10.5";
        font-bold-italic = lib.mkForce "Iosevka NFP:style=Bold Italic:size=10.5";
        box-drawings-uses-font-glyphs = "no";
        pad = "24x24";
      };

      cursor = with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      };
    };
  };
}

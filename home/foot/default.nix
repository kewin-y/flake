{
  config,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "CommitMono Nerd Font Propo:style=Regular:size=10.5";
        font-bold = lib.mkForce "CommitMono Nerd Font Propo:style=Bold:size=10.5";
        font-italic = lib.mkForce "CommitMono Nerd Font Propo:style=Italic:size=10.5";
        font-bold-italic = lib.mkForce "CommitMono Nerd Font Propo:style=Bold Italic:size=10.5";
        box-drawings-uses-font-glyphs = "no";
        pad = "24x24";
      };

      cursor = with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      };
    };
  };
}

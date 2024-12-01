{config, lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "${config.font} Nerd Font Propo:size=10";
        box-drawings-uses-font-glyphs = "no";
        pad = "16x16";
      };

      cursor = with config.lib.stylix.colors; {
        color = "${base00} ${base05}";
      };
    };
  };
}

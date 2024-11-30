{config, lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "${config.font} Nerd Font Propo:size=12";
        font-bold = lib.mkForce "${config.font} Nerd Font Propo:size=12";
        font-italic = lib.mkForce "${config.font} Nerd Font Propo:size=12";
        font-bold-italic = lib.mkForce "${config.font} Nerd Font Propo:size=12";
        box-drawings-uses-font-glyphs = "no";
        pad = "16x16";
      };

      cursor = {
        color = "111516 c2c4c2";
      };
    };
  };
}

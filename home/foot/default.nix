{config, lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "${config.font} Font 14 Nerd Font Propo:size=10.5";
        font-bold = lib.mkForce "${config.font} Font 14 Nerd Font Propo:size=10.5";
        font-italic = lib.mkForce "${config.font} Font 14 Nerd Font Propo:size=10.5";
        font-bold-italic = lib.mkForce "${config.font} Font 14 Nerd Font Propo:size=10.5";
        box-drawings-uses-font-glyphs = "no";
        pad = "16x16";
      };

      cursor = {
        color = "111516 c2c4c2";
      };
    };
  };
}

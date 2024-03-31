{pkgs, ...}: {
  stylix = {
    image = ../../wallpapers/michael.png;
    # base16Scheme = ./paradise.yaml;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    targets = {
      hyprland.enable = false;
      firefox.enable = false;
      fzf.enable = false;
    };

    fonts = {
      monospace = {
        name = "Maple Mono";
        package = pkgs.maple-mono;
      };
      sansSerif = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex;
      };
    };
  };
}

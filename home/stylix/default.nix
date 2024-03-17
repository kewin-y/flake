{
  pkgs,
  wallpaper,
  ...
}: {
  stylix = {
    image = wallpaper;
    base16Scheme = ./meut.yaml;
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    # I put so much effort into theming hyprland and foot qwq
    targets = {
      hyprland.enable = false;
      foot.enable = false;
    };
    fonts = {
      monospace = {
        name = "Iosevka";
        package = pkgs.iosevka;
      };
      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };
    };
  };
}

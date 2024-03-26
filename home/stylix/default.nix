{
  pkgs,
  wallpaper,
  ...
}: {
  stylix = {
    image = wallpaper;
    base16Scheme = ./far.yaml;
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    targets = {
      hyprland.enable = false;
      firefox.enable = false;
    };

    fonts = {
      monospace = {
        name = "BlexMonoNerdFont";
        package = pkgs.nerdfonts.override {fonts = ["IBMPlexMono"];};
      };
      sansSerif = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex;
      };
    };
  };
}

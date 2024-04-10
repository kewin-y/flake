{pkgs, ...}: {
  stylix = {
    image = ../../wallpapers/wallhaven-v93z13.jpg;
    base16Scheme = ./paradise.yaml;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
    polarity = "light";
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
        name = "ZedMono NF";
        package = pkgs.nerdfonts.override {fonts = ["ZedMono"];};
      };
      sansSerif = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex;
      };
    };
  };
}

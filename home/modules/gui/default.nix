{
  pkgs,
  config,
  lib,
  ...
}:
lib.mkIf config.enableGui {
  gtk = {
    enable = true;
    iconTheme = {
      name =
        if config.theme.stylix.polarity == "dark"
        then "Papirus-Dark"
        else "Papirus-Light";
      package = pkgs.papirus-icon-theme.override {color = "blue";};
    };
  };
  qt = {
    enable = true;
  };
}

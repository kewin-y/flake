{
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "blue";};
    };
  };
  qt = {
    enable = true;
  };
}

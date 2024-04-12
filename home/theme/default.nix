{pkgs, ...}: {
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugins
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "nordic";};
    };
  };

  qt = {
    style = {
      name = "gtk2";
    };
    platformTheme = "gtk";
    enable = true;
  };
}

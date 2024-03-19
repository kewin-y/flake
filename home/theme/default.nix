{pkgs, ...}: {
  # This doesn't work half the time
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-black-dark";
      package = pkgs.tela-icon-theme;
    };
  };

  qt = {
    style = {
      name = "kvantum";
    };
    platformTheme = "qtct";
    enable = true;
  };
}

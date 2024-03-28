{pkgs, ...}: {
  # This doesn't work half the time
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugins
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
      name = "gtk2";
    };
    platformTheme = "gtk";
    enable = true;
  };
}

{pkgs, ...}: {
    gtk = {
      enable = true;
      iconTheme = {
        name =
          if config.themeVariant == "dark"
          then "Papirus-Dark"
          else "Papirus-Light";
        package = pkgs.papirus-icon-theme.override {color = "blue";};
      };
    };

    qt = {
      enable = true;
    };
}

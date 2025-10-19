{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-wlr];
      config = {
        labwc = {
          default = ["wlr" "*"];
          "org.freedesktop.impl.portal.Inhibit" = ["none"];
        };
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = ["zen.desktop"];
        "x-scheme-handler/https" = ["zen.desktop"];
        "x-scheme-handler/chrome" = ["zen.desktop"];
        "text/html" = ["zen.desktop"];
        "application/x-extension-htm" = ["zen.desktop"];
        "application/x-extension-html" = ["zen.desktop"];
        "application/x-extension-shtml" = ["zen.desktop"];
        "application/xhtml+xml" = ["zen.desktop"];
        "application/x-extension-xhtml" = ["zen.desktop"];
        "application/x-extension-xht" = ["zen.desktop"];
      };
    };
  };
}

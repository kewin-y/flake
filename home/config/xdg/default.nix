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

  };
}

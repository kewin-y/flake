{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        image = [
          {
            run = ''${pkgs.imv}/bin/imv "$1"'';
            desc = "View Image";
          }
        ];
      };
      open = {
        rules = [
          {
            mime = "image/*";
            use = "image";
          }
        ];
      };
    };
    theme = {
      icon = {
        rules = [];
      };
    };
  };
}

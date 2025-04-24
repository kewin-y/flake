{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../modules
  ];

  theme.stylix.enable = false;

  term = {
    yazi = {
      enable = true;
      enableOpeners = false;
    };
    tmux.enable = true;
  };

  enableGui = false;
  enableWm = false;

  # Read the changelog before changing this value
  home.stateVersion = "24.05";
}

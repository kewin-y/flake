{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../home/git
  ];

  # Read the changelog before changing this value
  home.stateVersion = "24.05";
}

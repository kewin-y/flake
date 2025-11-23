{
  pkgs,
  inputs,
  sysVer,
  ...
}: {
  imports = [
    ./config
  ];

  programs = {
    home-manager.enable = true;
    btop.enable = true;
    zathura.enable = true;
  };


  home = {
    username = "kevin";
    homeDirectory = "/home/kevin";

    stateVersion = sysVer;

    sessionVariables = {
      TERMINAL = "foot";
    };
  };
}

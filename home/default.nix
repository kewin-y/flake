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

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
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

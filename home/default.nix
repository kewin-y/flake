{
  pkgs,
  inputs,
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

    # NOTE: Do not change
    stateVersion = "23.11";

    sessionVariables = {
      TERMINAL = "foot";
    };
  };
}

{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./modules
  ];

  programs.home-manager.enable = true;

  programs.btop.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "kevin";
    homeDirectory = "/home/kevin";

    # NOTE: Do not change
    stateVersion = "23.11";

    packages = with pkgs; [
      inputs.nvim-config.packages.${pkgs.system}.default
      nemo-with-extensions
      swayimg
      mpv
      htop
      obsidian
      pavucontrol
      obs-studio
      killall
    ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
    };
  };

  theme = {
    enableStylix = true;
    name = "everforest-dark-hard";
    polarity = "dark";
  };

  wallpaper = ../wallpapers/slate.jpg;
}

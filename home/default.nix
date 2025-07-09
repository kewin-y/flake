{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules
  ];

  programs = {
    home-manager.enable = true;
    btop.enable = true;
    chromium.enable = true;
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

    packages = with pkgs; [
      inputs.nvim-config.packages.${pkgs.system}.default
      nemo-with-extensions
      swayimg
      mpv
      htop
      obsidian
      pavucontrol
      obs-studio
      rnote
    ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
    };
  };

  wallpaper = ../wallpapers/wallhaven-rdr5gj.jpg;
}

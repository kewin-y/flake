{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./home
  ];

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

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  wallpaper = ./wallpapers/slate.jpg;
  theme = "everforest-dark-hard";
  themeVariant = "dark";

  programs.btop.enable = true;
  programs.home-manager.enable = true;
}

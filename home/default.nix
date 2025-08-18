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
      typst
    ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
    };
  };
}

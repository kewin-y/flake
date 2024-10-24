{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./home
  ];
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    nemo-with-extensions
    imv
    mpv
    fastfetch
    nitch
    pfetch
    htop
    obs-studio
    unityhub
    obsidian
    wl-clipboard
    inputs.nixvim-config.packages.${system}.default
    ripgrep
  ];

  programs.btop.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "foot";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
    };
  };

  programs.home-manager.enable = true;
}

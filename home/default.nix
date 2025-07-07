{
  pkgs,
  inputs,
  config,
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
      stylix.targets = {
        neovim.enable = false;
        nixvim.enable = false;
        spicetify.enable = false;
        fzf.enable = false;
        tmux.enable = false;

        waybar.enable = false;
        fuzzel.enable = false;
        mako.enable = false;

        firefox.profileNames = ["kevin"];

        gtk.extraCss = with config.lib.stylix.colors; ''
          @define-color accent_color #${base0D};
          @define-color accent_bg_color #${base0D};

          * {
            border-radius: 0;
          }
        '';
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
      killall
    ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "foot";
    };
  };


  wallpaper = ../wallpapers/wallhaven-rdr5gj.jpg;
}

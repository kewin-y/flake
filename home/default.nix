{lib, ...}: {
  imports = [
    ./ags
    ./firefox
    ./foot
    ./git
    ./hyprland
    ./misc
    ./mksh
    ./nixvim
    ./spicetify
    ./stylix
    ./tmux
    ./yazi
    ./zathura
  ];

  options = {
    wallpaper = lib.mkOption {
      default = ../wallpapers/mountains.jpg;
      type = lib.types.path;
    };

    theme = lib.mkOption {
      default = "material-darker";
      type = lib.types.enum [
        "far"
        "material-darker"
        "material"
        "oxocarbon"
        "paradise"
        "test"
        "decay"
        "rose-pine-dawn"
        "yoru"
      ];
    };
  };

  config = {
    wallpaper = ../wallpapers/hunter-so-_Sl9SshvMO0-unsplash.jpg;
    theme = "yoru";
  };
}

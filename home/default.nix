{lib, ...}: {
  imports = [
    ./mksh
    ./misc
    ./foot
    ./hyprland
    ./ags
    ./stylix
    ./git
    ./dev
    ./yazi
    ./zathura
    ./firefox
    ./tmux
    ./nixvim
  ];

  options = {
    wallpaper = lib.mkOption {
      default = ../wallpapers/mountains.jpg;
      type = lib.types.path;
    };

    theme = lib.mkOption {
      default = "material-darker";
      type = lib.types.enum [
        "oxocarbon"
        "far"
        "material-darker"
        "material"
        "oxocarbon"
        "paradise"
      ];
    };

    font = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = {
    wallpaper = ../wallpapers/mountains.jpg;
    theme = "material-darker";
    font = "Iosevka";
  };
}

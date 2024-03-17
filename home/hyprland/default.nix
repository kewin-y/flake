{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./config/binds.nix
    ./config/theme.nix
    ./config/rules.nix
    ./config/anims.nix
    ./config/general.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };
}

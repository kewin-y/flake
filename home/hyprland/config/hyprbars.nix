{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # ...
    ];

    settings = with config.lib.stylix.colors; {
      "plugin:hyprbars" = {
        bar_color = "#${base01}";
        bar_part_of_window = true;
      };
    };
  };
}

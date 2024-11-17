{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];

    settings = with config.lib.stylix.colors; {
      "plugin:hyprbars" = {
        bar_color = "rgb(${base01})";
        bar_height = 32;
        col.text = "rgb(${base01}";
        bar_precedence_over_border = false;
        bar_part_of_window = true;
      };
    };
  };
}

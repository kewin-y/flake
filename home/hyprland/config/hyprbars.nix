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
        "col.text" = "rgb(${base05})";
        bar_precedence_over_border = false;
        bar_part_of_window = true;
        bar_padding = 12;
        bar_text_align = "left";
        hyprbars-button = [
          "rgb(${base08}), 10, , hyprctl dispatch killactive"
          "rgb(${base0B}), 10, , hyprctl dispatch fullscreen 1"
        ];
      };
    };
  };
}

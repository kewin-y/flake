{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  programs.hyprcursor-phinger.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "HYPRCURSOR_THEME,phinger-cursors-light-hyprcursor"
        "HYPRCURSOR_SIZE,24"
      ];
      general = with config.lib.stylix.colors; {
        gaps_in = 8;
        gaps_out = 12;
        border_size = 2;
        "col.inactive_border" = "rgb(${base01})";
        "col.active_border" = "rgb(${base01})";
        layout = "dwindle";
        resize_on_border = "true";
      };
      decoration = {
        shadow = {
          enabled = true;
          range = 18;
          render_power = 3;
          color= "rgba(00000066)";
        };
        rounding = 5;
        dim_inactive = true;
        dim_strength = 0.05;
      };
    };
  };
}

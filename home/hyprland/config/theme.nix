{inputs, config, ...}: {
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
        gaps_in = "8";
        gaps_out = "12";
        border_size = "2";
        "col.inactive_border" = "rgb(${base01})";
        "col.active_border" = "rgb(${base01})";
        layout = "dwindle";
        resize_on_border = "true";
      };
      decoration = {
        rounding = "0";
        inactive_opacity = "0.94";

        blur = {
          enabled = "yes";
          size = "3";
          passes = "4";
          new_optimizations = "on";
          ignore_opacity = "on";
          xray = "false";
        };
      };
    };
  };
}

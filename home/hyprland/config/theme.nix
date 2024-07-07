{inputs, ...}: {
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
      general = {
        gaps_in = "8";
        gaps_out = "12";
        border_size = "0";
        layout = "dwindle";
        resize_on_border = "true";
      };
      decoration = {
        rounding = "4";
        drop_shadow = "true";
        shadow_range = "18";
        "col.shadow" = "rgba(00000066)";
        shadow_render_power = "3";
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

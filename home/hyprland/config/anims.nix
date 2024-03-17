{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.25, 0.96, 0.1, 1.05"
          "winOut, 0.5, 0.4, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, wind, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, popin 80%"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind, slidefade 80%"
        ];
      };
    };
  };
}

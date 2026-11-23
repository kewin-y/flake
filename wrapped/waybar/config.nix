pkgs:
pkgs.writeText "config.jsonc" (builtins.toJSON {
  layer = "top";
  position = "bottom";
  height = 42;
  spacing = 22;
  modules-left = ["clock"];
  modules-center = ["niri/workspaces"];
  modules-right = ["tray" "wireplumber" "network" "battery"];
  "niri/workspaces" = {
    format = "{index}";
  };
  clock = {
    tooltip = false;
    interval = 60;
    format = "{:%a %b %d %H:%M}";
    max-length = 25;
  };
  tray = {
    icon-size = 12;
    spacing = 16;
  };
  wireplumber = {
    format-icons = ["" "" ""];
    format = "{icon}";
    format-muted = "󰖁";
    tooltip-format = "{volume}% | {node_name}";
    on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
  };
  battery = {
    interval = 3;
    states = {
      warning = 30;
      critical = 15;
    };
    format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
    format = "{icon}";
    format-charging = "{icon} 󰉁";
    tooltip-format = "{capacity}% | {timeTo}";
    max-length = 25;
  };
  network = {
    format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
    format = "{ifname}";
    format-wifi = "{icon}";
    format-ethernet = "";
    format-disconnected = "󰤭";
    tooltip-format = "{ifname} via {gwaddr}";
    tooltip-format-wifi = "{signalStrength}% | {essid}";
    tooltip-format-ethernet = "Connected: Wired";
    tooltip-format-disconnected = "Disconnected";
    max-length = 50;
  };
})

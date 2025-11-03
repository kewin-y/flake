{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 36;
        spacing = 5;
        modules-left = ["wlr/taskbar"];
        modules-right = ["tray" "wireplumber" "battery" "network" "clock"];
        "clock" = {
          tooltip = false;
          interval = 60;
          format = "{:%a %b %d %H:%M}";
          max-length = 25;
        };
        "wlr/taskbar" = {
          format = "{name}";
          on-click = "minimize-raise";
        };
        "tray" = {
          icon-size = 12;
          spacing = 8;
        };
        "wireplumber" = {
          format-icons = ["" "" ""];
          format = "{icon}";
          format-muted = "󰖁 ";
          tooltip-format = "{volume}% | {node_name}";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
        };
        "battery" = {
          # :(
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
        "network" = {
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
      }
    ];
    style = with config.lib.stylix.colors.withHashtag; ''
      *:not(separator) {
        all: unset;
        font-family: "Iosevka NFP";
        font-size: 9pt;
      }

      /* Main Bar */
      window#waybar {
        background: ${base00};
        border-top: 1px solid ${base03};
        color: ${base05};
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      .modules-left {
        margin-left: 0.5rem;
      }

      .modules-right {
        margin-right: 0.5rem;
      }

      menu {
        background: ${base01};
        padding: 8px;
      }

      menu separator {
        background: ${base03};
        margin: 0.4rem 0;
      }

      menu menuitem {
        color: ${base05};
        padding: 0.8rem;
      }

      menu menuitem:hover {
        background: ${base02};
      }

      tooltip {
        background: ${base01};
        color: ${base05};
      }

      tooltip label {
        margin: 0.8rem;
      }

      #clock,
      #taskbar,
      #tray,
      #battery,
      #wireplumber,
      #network {
        margin: 0 0.5rem;
      }

      #taskbar button {
        margin: 0 0.8rem;
      }

      #taskbar:first-child {
        margin-left: 0;
      }

      #taskbar:last-child {
        margin-right: 0;
      }

      #taskbar button:hover,
      #taskbar button.active {
        font-weight: bold;
      }
    '';
  };
}

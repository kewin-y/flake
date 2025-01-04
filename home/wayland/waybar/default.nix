{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 30;
        spacing = 4;
        modules-left = ["clock"];
        modules-center = ["wlr/taskbar"];
        modules-right = ["tray" "battery" "wireplumber" "network"];
        "clock" = {
          interval = 60;
          format = "<span font='8'></span> {:%H:%M}";
          max-length = 25;
        };
        "wlr/taskbar" = {
          format = "{app_id}";
          on-click = "minimize-raise";
        };
        "tray" = {
          icon-size = 12;
          spacing = 8;
        };
        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<span font='8' rise='1pt'>{icon}</span> {capacity}%";
          format-charging = "<span font='8' rise='1pt'>{icon}</span> {capacity}%";
          format-icons = ["" "" "" ""];
          max-length = 25;
        };
        "wireplumber" = {
          format = "<span font='8' rise='1pt'>{icon}</span> {volume}%";
          format-muted = "<span font='8' rise='1pt'></span> {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          format-icons = ["" ""];
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "<span font='8'></span> {essid}";
          format-ethernet = "<span font='8'></span> Wired";
          format-disconnected = "<span font='8'></span>";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "Wired Connected";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };
      }
    ];
    style = with config.lib.stylix.colors.withHashtag; ''
      *:not(separator) {
        all: unset;
        font-family: tamzen, siji;
        font-size: 12px;
      }

      /* Main Bar */
      window#waybar {
        background: ${base00};
        border-top: 1px solid ${base01};
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
      }

      menu separator {
        background: ${base03};
        margin: 0.4rem 0.8rem;
      }

      menu menuitem {
        color: ${base05};
        padding: 0.8rem;
      }

      menu menuitem:hover {
        background: ${base02};
      }

      #clock,
      #taskbar,
      #tray,
      #battery,
      #wireplumber,
      #network {
        margin: 0.5rem;
      }

      #taskbar button {
        padding: 0 0.8rem;
        margin: 0 0.4rem;
      }

      #taskbar:first-child {
        margin-left: 0;
      }

      #taskbar:last-child {
        margin-right: 0;
      }

      #taskbar button:hover {
        box-shadow: 0 0 0 1px ${base03};
      }

      #taskbar button.active {
        box-shadow: 0 0 0 1px ${base0D};
      }
    '';
  };
}

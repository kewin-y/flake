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
          format = "{:%H:%M}";
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
          # :(
          interval = 3;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "BAT {capacity}%";
          format-charging = "BAT * {capacity}%";
          max-length = 25;
        };
        "wireplumber" = {
          format = "VOL {volume}%";
          format-muted = "VOL MUT {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          format-icons = ["" ""];
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "{essid}";
          format-ethernet = "Wired";
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
        font-family: tamzen;
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
        padding: 0.8rem;
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
        background: ${base02};
      }

      #taskbar button.active {
        background: ${base0D};
        color: ${base01};
      }
    '';
  };
}

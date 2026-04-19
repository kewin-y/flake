{
  globals,
  config,
  pkgs,
  wrapped,
  ...
}: let
  niriConf = pkgs.writeText "config.kdl" ''
    input {
        keyboard {
            numlock
        }
    }

    cursor {
        xcursor-theme "${config.kevin.gui.cursor-theme}"
        xcursor-size 24
    }

    layout {
        gaps 16

        center-focused-column "never"

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }
        border {
            off
        }

        focus-ring {
            on
            width 2
            active-color "${globals.base16Scheme.base03}"
        }

        shadow {
            on
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }
    }

    window-rule {
      geometry-corner-radius 5
      clip-to-geometry true
    }

    prefer-no-csd

    environment {
      XDG_CURRENT_DESKTOP "niri"
      XDG_SESSION_DESKTOP "niri"
      GTK_USE_PORTAL "1"
    }

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
    gestures {
      hot-corners {
          off
      }
    }

    hotkey-overlay {
        skip-at-startup
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return hotkey-overlay-title="Open a Terminal: foot" { spawn "foot"; }
        Mod+Space hotkey-overlay-title="Run an Application: fuzzel" { spawn "fuzzel"; }
        Mod+Ctrl+F hotkey-overlay-title="Open Browser: Zen" { spawn "zen"; }
        Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn "swaylock"; }
        Mod+A hotkey-overlay-title="View notification actions" { spawn-sh "makoctl menu -- fuzzel --dmenu"; }
        Mod+D hotkey-overlay-title="Dismiss notification" { spawn-sh "makoctl dismiss"; }

        XF86AudioLowerVolume { spawn "pamixer" "-d" "5"; }
        XF86AudioRaiseVolume { spawn "pamixer" "-i" "5"; }
        XF86AudioMute { spawn "pamixer" "--toggle-mute"; }
        XF86MonBrightnessUp { spawn "brillo" "-q" "-A" "10"; }
        XF86MonBrightnessDown { spawn "brillo" "-q" "-U" "10"; }

        // XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        // XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
        // XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
        // XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

        Mod+O repeat=false { toggle-overview; }

        Mod+W repeat=false { close-window; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Down  { move-window-down; }
        Mod+Ctrl+Up    { move-window-up; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+H     { move-column-left; }
        Mod+Ctrl+J     { move-window-down; }
        Mod+Ctrl+K     { move-window-up; }
        Mod+Ctrl+L     { move-column-right; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+Left  { focus-monitor-left; }
        Mod+Shift+Down  { focus-monitor-down; }
        Mod+Shift+Up    { focus-monitor-up; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+H     { focus-monitor-left; }
        Mod+Shift+J     { focus-monitor-down; }
        Mod+Shift+K     { focus-monitor-up; }
        Mod+Shift+L     { focus-monitor-right; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        Mod+Page_Down      { focus-workspace-down; }
        Mod+Page_Up        { focus-workspace-up; }
        Mod+U              { focus-workspace-down; }
        Mod+I              { focus-workspace-up; }
        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        Mod+Ctrl+U         { move-column-to-workspace-down; }
        Mod+Ctrl+I         { move-column-to-workspace-up; }

        Mod+Shift+Page_Down { move-workspace-down; }
        Mod+Shift+Page_Up   { move-workspace-up; }
        Mod+Shift+U         { move-workspace-down; }
        Mod+Shift+I         { move-workspace-up; }

        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }

        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }


        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+Comma  { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }

        Mod+Ctrl+G { expand-column-to-available-width; }

        Mod+C { center-column; }

        Mod+Ctrl+C { center-visible-columns; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+V       { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }

        Mod+Q { toggle-column-tabbed-display; }

        Mod+Shift+S { screenshot show-pointer=false; }
        Mod+Alt+S { screenshot-screen show-pointer=false; }
        Mod+Ctrl+S { screenshot-window; }

        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }
    }
  '';
in {
  # Let the module configure the portals (for now)
  programs.niri.enable = true;

  security.pam.services.swaylock = {};

  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  systemd.user.services.swaybg = {
    description = "Swaybg";
    after = ["niri.service"];
    wantedBy = ["niri.service"];

    serviceConfig = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.kevin.wallpaper} -m fill";
      Restart = "on-failure";
    };
  };

  # Since we wrap the package, we need to manually set a systemd service
  systemd.user.services.waybar = {
    description = "Waybar";
    wantedBy = ["niri.service"];
    after = ["niri.service"];
    serviceConfig = {
      ExecStart = "${wrapped.waybar}/bin/waybar";
      Restart = "on-failure";
    };
  };

  systemd.user.services.mako = {
    description = "Mako";
    wantedBy = ["niri.service"];
    after = ["niri.service"];
    serviceConfig = {
      ExecStart = "${wrapped.mako}/bin/mako";
      Restart = "on-failure";
    };
  };

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];

  hjem.users.${globals.user}.files = {
    ".config/niri/config.kdl".source = niriConf;
  };
}

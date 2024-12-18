{pkgs, ...}: let
  mainMod = "SUPER";
in {
  home.packages = with pkgs; [
    slurp
    swappy
    grim
    grimblast
    brillo
    pamixer
  ];

  wayland.windowManager.hyprland = {
    settings = {
      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
      binde = [
        "${mainMod} ALT, l, resizeactive, 30 0"
        "${mainMod} ALT, h, resizeactive, -30 0"
        "${mainMod} ALT, k, resizeactive, 0 -30"
        "${mainMod} ALT, j, resizeactive, 0 30"
      ];
      bindl = [
        ", XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer --toggle-mute"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer -i 5"
        ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer -d 5"

        ", XF86MonBrightnessUp, exec, ${pkgs.brillo}/bin/brillo -q -A 10"
        ", XF86MonBrightnessDown, exec, ${pkgs.brillo}/bin/brillo -q -U 10"
      ];
      bind = let
        screenshot = import ../scripts/screenshot.nix {inherit pkgs;};
        workspace = num: "${mainMod}, ${num}, workspace, ${num}";
        moveToWorkspace = num: "${mainMod} SHIFT, ${num}, movetoworkspace, ${num}";
        moveToWorkspaceSilent = num: "${mainMod} ALT, ${num}, movetoworkspacesilent, ${num}";

        workspaces = [1 2 3 4 5];
      in
        [
          # Windows
          "${mainMod}, W, killactive"
          "${mainMod}, delete, exit"
          "${mainMod}, S, togglefloating"
          "${mainMod}, F, fullscreen"

          # Apps
          "${mainMod}, return, exec, foot"
          "${mainMod} CTRL, F, exec, firefox"
          "${mainMod}, SPACE, exec, astal toggle-popup app-launcher"
          "${mainMod}, B, exec, astal -t bar-0"

          # Screenshot
          "${mainMod} SHIFT, S, exec, ${screenshot}/bin/screenshot s"
          "${mainMod} ALT, S, exec, ${screenshot}/bin/screenshot f"
          ",print, exec, ${screenshot}/bin/screenshot f"

          # Focus
          "${mainMod}, h, movefocus, l"
          "${mainMod}, l, movefocus, r"
          "${mainMod}, k, movefocus, u"
          "${mainMod}, j, movefocus, d"
          "ALT, Tab, movefocus, d"

          # Switch workspaces relative
          "${mainMod} CTRL, l, workspace, r+1"
          "${mainMod} CTRL, h, workspace, r-1"

          # Move window around
          "${mainMod} SHIFT, h, movewindow, l"
          "${mainMod} SHIFT, l, movewindow, r"
          "${mainMod} SHIFT, k, movewindow, u"
          "${mainMod} SHIFT, j, movewindow, d"

          # Special workspaces
          "${mainMod}, E, movetoworkspacesilent, special"
          "${mainMod}, U, togglespecialworkspace"

          # Toggle Layout
          "${mainMod}, Y, togglesplit, # dwindle"
          "${mainMod}, P, pseudo"
        ]
        ++ map (i: workspace (toString i)) workspaces
        ++ map (i: moveToWorkspace (toString i)) workspaces
        ++ map (i: moveToWorkspaceSilent (toString i)) workspaces;
    };
  };
}

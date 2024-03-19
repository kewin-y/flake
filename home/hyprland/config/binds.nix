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
        # LOL
        screenshot = pkgs.writeShellScriptBin "screenshot" ''
          if [ -z "$XDG_PICTURES_DIR" ] ; then
              XDG_PICTURES_DIR="$HOME/Pictures"
          fi

          swpy_dir="$HOME/.config/swappy"
          save_dir="''${2:-$XDG_PICTURES_DIR/Screenshots}"
          save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
          temp_screenshot="/tmp/screenshot.png"

          mkdir -p $save_dir
          mkdir -p $swpy_dir
          echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > $swpy_dir/config

          case $1 in
          p)
              ${pkgs.grimblast}/bin/grimblast copysave screen $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          s)
              ${pkgs.grimblast}/bin/grimblast --freeze copysave area $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          m)
              ${pkgs.grimblast}/bin/grimblast copysave output $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          *)
              exit ;;
          esac

          if [ -f "$save_dir/$save_file" ] ; then
              notify-send "Cheese!~" "Screenshot saved in $save_dir" -i $save_dir/$save_file
          fi
        '';

        workspace = num: "${mainMod}, ${num}, workspace, ${num}";
        moveToWorkspace = num: "${mainMod} SHIFT, ${num}, movetoworkspace, ${num}";
        moveToWorkspaceSilent = num: "${mainMod} ALT, ${num}, movetoworkspacesilent, ${num}";

        workspaceArr = [ 1 2 3 4 5 6 7 ];
      in [
        # Windows
        "${mainMod}, W, killactive"
        "${mainMod}, delete, exit"
        "${mainMod}, S, togglefloating"
        "${mainMod}, G, togglegroup"
        "${mainMod}, F, fullscreen"

        # Apps
        "${mainMod}, return, exec, foot"
        "${mainMod} CTRL, F, exec, firefox"
        "${mainMod} CTRL, I, exec, thunar"
        "${mainMod}, SPACE, exec, pkill -x tofi-drun || tofi-drun"

        # Screenshot
        "${mainMod} SHIFT, S, exec, ${screenshot}/bin/screenshot s"
        "${mainMod} ALT, S, exec, ${screenshot}/bin/screenshot m"
        ",print, exec, ${screenshot}/bin/screenshot p"

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

      ] ++ map (i: workspace (toString i)) workspaceArr
        ++ map (i: moveToWorkspace (toString i)) workspaceArr
        ++ map (i: moveToWorkspaceSilent (toString i)) workspaceArr;
    };
  };
}

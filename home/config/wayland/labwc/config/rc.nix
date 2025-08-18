{
  pkgs,
  config,
  lib,
  ...
}: {
  home.file.".config/labwc/rc.xml".text = let
    screenshot = import ../scripts/screenshot.nix pkgs;
    lock = import ../scripts/waylock.nix {
      inherit pkgs;
      inherit config;
    };
  in ''
    <?xml version="1.0"?>
    <labwc_config>
      <theme>
        <name></name>
        <titlebar>
          <layout>:iconify,max,close</layout>
          <showTitle>yes</showTitle>
        </titlebar>
        <cornerRadius>0</cornerRadius>
        <font name="Rubik" size="9" />
      </theme>
      <keyboard>
        <default />

        <!-- Apps -->
        <keybind key="W-Return">
          <action name="Execute" command="foot" />
        </keybind>
        <keybind key="C-W-f">
          <action name="Execute" command="firefox" />
        </keybind>
        <keybind key="W-Space">
          <action name="Execute" command="fuzzel" />
        </keybind>

        <!-- Controls -->
        <keybind key="A-F4" />
        <keybind key="W-f">
          <action name="ToggleMaximize" />
        </keybind>
        <keybind key="W-s">
          <action name="Iconify" />
        </keybind>
        <keybind key="W-w">
          <action name="Close" />
        </keybind>
        <keybind key="W-r">
          <action name="Reconfigure" />
        </keybind>
        <keybind key="C-W-l">
          <action name="Execute" command="${lock}/bin/lock" />
        </keybind>

        <!-- Screenshot -->
        <keybind key = "W-A-s">
          <action name="Execute" command="${screenshot}/bin/screenshot f" />
        </keybind>
        <keybind key = "W-S-s">
          <action name="Execute" command="${screenshot}/bin/screenshot s" />
        </keybind>

        <!-- Move to edge -->
        <keybind key="W-S-h">
          <action name="MoveToEdge" direction="left" />
        </keybind>
        <keybind key="W-S-l">
          <action name="MoveToEdge" direction="right" />
        </keybind>
        <keybind key="W-S-k">
          <action name="MoveToEdge" direction="up" />
        </keybind>
        <keybind key="W-S-j">
          <action name="MoveToEdge" direction="down" />
        </keybind>

        <!-- Snap to edge -->
        <keybind key="W-h">
          <action name="SnapToEdge" direction="left" />
        </keybind>
        <keybind key="W-l">
          <action name="SnapToEdge" direction="right" />
        </keybind>
        <keybind key="W-k">
          <action name="SnapToEdge" direction="up" />
        </keybind>
        <keybind key="W-j">
          <action name="SnapToEdge" direction="down" />
        </keybind>

        <!-- notifications -->
        <keybind key="W-p">
          <action name="Execute" command="makoctl dismiss" />
        </keybind>
        <keybind key="W-o">
          <action name="Execute" command="makoctl menu -- fuzzel --dmenu" />
        </keybind>

        <!-- Brightness, Vol, etc. -->
        <keybind key="XF86_AudioLowerVolume">
          <action name="Execute" command="pamixer -d 5" />
        </keybind>
        <keybind key="XF86_AudioRaiseVolume">
          <action name="Execute" command="pamixer -i 5" />
        </keybind>
        <keybind key="XF86_AudioMute">
          <action name="Execute" command="pamixer --toggle-mute" />
        </keybind>
        <keybind key="XF86_MonBrightnessUp">
          <action name="Execute" command="brillo -q -A 10" />
        </keybind>
        <keybind key="XF86_MonBrightnessDown">
          <action name="Execute" command="brillo -q -U 10" />
        </keybind>
      </keyboard>
      <mouse>
        <default />
        <context name="Root">
          <mousebind button="Left" action="Press" />
        </context>

        <context name="Frame">
          <mousebind button="W-Left" action="Press">
            <action name="Focus" />
            <action name="Raise" />
          </mousebind>
          <mousebind button="W-Left" action="Drag">
            <action name="Move" />
          </mousebind>
          <mousebind button="W-Right" action="Press">
            <action name="Focus" />
            <action name="Raise" />
          </mousebind>
          <mousebind button="W-Right" action="Drag">
            <action name="Resize" />
          </mousebind>
        </context>
      </mouse>
    </labwc_config>
  '';
}

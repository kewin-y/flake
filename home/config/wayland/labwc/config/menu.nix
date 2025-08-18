{
  pkgs,
  config,
  lib,
  ...
}: {
  home.file.".config/labwc/menu.xml".text = let
    lock = import ../scripts/waylock.nix {
      inherit pkgs;
      inherit config;
    };
  in ''
    <?xml version="1.0" encoding="UTF-8"?>
    <openbox_menu>
    <menu id="root-menu" label="root-menu">
      <item label="Terminal">
        <action name="Execute"><command>foot</command></action>
      </item>
      <Separator />
      <menu id="Media" label="Media">
        <item label="Firefox">
          <action name="Execute"><command>firefox --name firefox</command></action>
        </item>
        <item label="mpv Media Player">
          <action name="Execute"><command>mpv --player-operation-mode=pseudo-gui --</command></action>
        </item>
        <item label="Spotify">
          <action name="Execute"><command>spotify</command></action>
        </item>
        <item label="Volume Control">
          <action name="Execute"><command>pavucontrol</command></action>
        </item>
      </menu> <!-- Media -->
      <menu id="Office" label="Office">
        <item label="Obsidian">
          <action name="Execute"><command>obsidian</command></action>
        </item>
        <item label="Zathura">
          <action name="Execute"><command>zathura</command></action>
        </item>
      </menu> <!-- Office -->
      <menu id="Settings" label="Settings">
        <item label="Bluetooth Adapters">
          <action name="Execute"><command>blueman-adapters</command></action>
        </item>
        <item label="Bluetooth Manager">
          <action name="Execute"><command>blueman-manager</command></action>
        </item>
        <item label="Volume Control">
          <action name="Execute"><command>pavucontrol</command></action>
        </item>
      </menu> <!-- Settings -->
      <Separator />
      <menu id="PowerMenu" label="Power Menu">
        <item label="Power Off">
          <action name="Execute"><command>systemctl -i poweroff</command></action>
        </item>
        <item label="Lock">
          <action name="Execute"><command>${lock}/bin/lock</command></action>
        </item>
        <item label="Suspend">
          <action name="Execute"><command>systemctl -i suspend</command></action>
        </item>
        <item label="Reboot">
          <action name="Execute"><command>systemctl -i reboot</command></action>
        </item>
      </menu>
      <menu id="labwc" label="labwc">
        <item label="Reconfigure">
          <action name="Reconfigure" />
        </item>
        <item label="Exit">
          <action name="Exit" />
        </item>
      </menu>
    </menu> <!-- root-menu -->
    </openbox_menu>
  '';
}

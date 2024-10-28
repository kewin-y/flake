import Battery from "gi://AstalBattery";

import { bind } from "astal";
import Gtk from "gi://Gtk?version=3.0";

export default function BatteryLevel() {
  const bat = Battery.get_default();
  return (
    <box
      className={bind(bat, "charging").as((c) =>
        c ? "battery-label charging" : "battery-label",
      )}
      visible={bind(bat, "isPresent")}
    >
      {/* <box className={"battery-bulb"} /> */}
      <label
        valign={Gtk.Align.CENTER}
        label={bind(bat, "percentage").as(
          (p) => `${p > 0 ? Math.floor(p * 100) : 0}%`,
        )}
      />
      {/*Ok so for some reason the levelbar shows values normally when its really long*/}
      <levelbar
        widthRequest={100}
        inverted={true}
        mode={Gtk.LevelBarMode.CONTINUOUS}
        value={bind(bat, "percentage").as((p) => (p > 0 ? p : 0))}
      />
    </box>
  );
}

import Bluetooth from "gi://AstalBluetooth";
import { bind, Variable } from "astal";
import { Gtk } from "astal/gtk3";
import Pango from "gi://Pango";

export default function BluetoothInfo() {
  const bluetooth = Bluetooth.get_default();

  const bluetoothLabel = Variable.derive(
    [
      bind(bluetooth, "is_powered"),
      bind(bluetooth, "devices"),
      bind(bluetooth, "is_connected"),
    ],
    (powered, devices) => {
      if (powered) {
        for (const device of devices) {
          if (device.connected) {
            return (
              <label
                label={bind(device, "alias")}
                ellipsize={Pango.EllipsizeMode.END}
                max_width_chars={12}
              />
            );
          }
        }
        return <label label={"Disconnected"} />;
      }

      return <label label={"Off"} />;
    },
  );

  return (
    <centerbox
      vertical
      className={bind(bluetooth, "is_powered").as((powered) =>
        powered ? "info active" : "info",
      )}
      heightRequest={60}
      startWidget={
        <label
          label={"Bluetooth"}
          halign={Gtk.Align.START}
          valign={Gtk.Align.START}
        />
      }
      endWidget={
        <box spacing={8} valign={Gtk.Align.END} halign={Gtk.Align.START}>
          <icon
            icon={bind(bluetooth, "is_powered").as((powered) =>
              powered
                ? "bluetooth-active-symbolic"
                : "bluetooth-disabled-symbolic",
            )}
          />
          {bluetoothLabel()}
        </box>
      }
    />
  );
}

import WifiIcon from "../../../shared/WifiIcon";
import { bind, Variable } from "astal";
import Network from "gi://AstalNetwork";
import { Gtk } from "astal/gtk3";

export default function Wifi() {
  const network = Network.get_default();
  const { wifi } = network;

  const label = Variable.derive(
    [bind(network, "primary"), bind(wifi, "ssid")],
    (primary, ssid) => {
      switch (primary) {
        case Network.Primary.WIRED:
          return "Wired";
        case Network.Primary.WIFI:
          return ssid;
        case Network.Primary.UNKNOWN:
          return "Unknown";
        default:
          return "Unknown";
      }
    },
  );

  return (
    <box
      className={bind(network, "connectivity").as((state) =>
        state !== Network.Connectivity.UNKNOWN ? "wifi connected" : "wifi",
      )}
      hexpand
      vertical
      spacing={8}
    >
      <label label={"Network"} halign={Gtk.Align.START} />
      <box spacing={8}>
        <icon icon={bind(WifiIcon())} css={"font-size: 13px;"} />
        <label label={bind(label)} />
      </box>
    </box>
  );
}

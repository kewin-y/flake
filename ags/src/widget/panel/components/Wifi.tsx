import * as NetworkUtils from "../../../shared/NetworkUtils";
import { bind } from "astal";
import Network from "gi://AstalNetwork";
import { Gtk } from "astal/gtk3";

export default function Wifi() {
  const network = Network.get_default();

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
        <icon
          icon={bind(NetworkUtils.NetworkIcon())}
          css={"font-size: 13px;"}
        />
        <label label={bind(NetworkUtils.NetworkName())} />
      </box>
    </box>
  );
}

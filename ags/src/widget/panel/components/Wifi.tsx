import WifiIcon from "../../../shared/WifiIcon";
import { Gtk } from "astal/gtk3";

export default function Wifi() {
  return (
    <button className="wifi" heightRequest={32} widthRequest={32} valign={Gtk.Align.START}>
      {WifiIcon()}
    </button>
  );
}

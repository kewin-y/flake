import { Gtk, Astal, App } from "astal/gtk3";
import { PopupWindow } from "../PopupWindow";
import { Speaker } from "./components/Audio";
import NetworkInfo from "./components/NetworkInfo";
import BluetoothInfo from "./components/BluetoothInfo";
import NotifCentre from "./components/NotifCentre";
import Media from "./components/Media";
import Uptime from "./components/Uptime";
import { USER } from "../../shared/constants";

export default function Panel() {
  const anchor =
    Astal.WindowAnchor.TOP |
    Astal.WindowAnchor.BOTTOM |
    Astal.WindowAnchor.RIGHT;

  return (
    <PopupWindow
      name="panel"
      application={App}
      transition={Gtk.RevealerTransitionType.SLIDE_LEFT}
      anchor={anchor}
      keymode={Astal.Keymode.ON_DEMAND}
    >
      <box className="panel-box" vertical={true}>
        <centerbox
          className={"header"}
          startWidget={<label halign={Gtk.Align.START} label={USER} />}
          heightRequest={24}
          endWidget={<Uptime />}
        />
        <box spacing={12} className={"pb-lower"} vertical>
          <NotifCentre />
          <Media />
          <Speaker />
          <box spacing={12} homogeneous>
            <BluetoothInfo />
            <NetworkInfo />
          </box>
        </box>
      </box>
    </PopupWindow>
  );
}

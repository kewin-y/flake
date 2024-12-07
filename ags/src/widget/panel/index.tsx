import { Gtk, Astal, App } from "astal/gtk3";
import { PopupWindow } from "../PopupWindow";
import { Speaker } from "./components/Audio";
import Wifi from "./components/Wifi";
import NotifCentre from "./components/NotifCentre";
import Media from "./components/Media";
import Uptime from "./components/Uptime";
import { USER } from "../../shared/constants";

// Reminder to self: don't make bluetooth, wifi config widget, etc.

export default function Panel() {
  const anchor = Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT;

  return (
    <PopupWindow
      name="panel"
      application={App}
      transition={Gtk.RevealerTransitionType.SLIDE_UP}
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
        <box spacing={8} className={"pb-lower"} vertical>
          <Media />
          <NotifCentre />
          <box spacing={8}>
            <Speaker />
            <Wifi />
          </box>
        </box>
      </box>
    </PopupWindow>
  );
}

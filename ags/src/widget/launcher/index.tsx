import PopupWindow from "../../lib/PopupWindow";
import { App, Astal, Gtk, Widget } from "astal/gtk3";

const WINDOW_NAME = "app-launcher";

export default function Launcher() {
  const anchor = Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT;
  return (
    <PopupWindow
      name={WINDOW_NAME}
      application={App}
      transition={Gtk.RevealerTransitionType.SLIDE_UP}
      duration={300}
      anchor={anchor}
      margin={[4]}
    ></PopupWindow>
  );
}

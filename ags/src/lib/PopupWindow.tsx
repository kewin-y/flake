import { App, Gtk, Widget, Gdk } from "astal/gtk3";
import { timeout } from "astal";

export function closePopupWindow(win: Gtk.Window) {
  (win.get_child() as Gtk.Revealer).revealChild = false;
  timeout(300, () => win.hide());
}

export function togglePopupWindow(windowName: string) {
  const win = App.get_window(windowName)!;
  if (win.is_visible() === false) {
    win.show();
    (win.get_child() as Gtk.Revealer).revealChild = true;
  } else {
    closePopupWindow(win);
  }
}

type PopupWindowProps = Omit<Widget.WindowProps, "name"> & {
  name: string;
  transition: Gtk.RevealerTransitionType;
  duration: number;
  child?: JSX.Element;
};

export function PopupWindow({
  name,
  transition,
  duration,
  child,
  ...rest
}: PopupWindowProps) {
  return (
    <window
      name={name}
      visible={false}
      widthRequest={2}
      heightRequest={2}
      {...rest}
      onKeyPressEvent={(self, event) => {
        const keyVal = event.get_keyval()[1];
        if (keyVal === Gdk.KEY_Escape) {
          closePopupWindow(self);
        }
      }}
    >
      <revealer
        transitionType={transition}
        transitionDuration={duration}
        hexpand={true}
        vexpand={true}
        child={child || <box></box>}
        revealChild={false}
      ></revealer>
    </window>
  );
}

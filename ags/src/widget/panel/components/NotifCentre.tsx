import {
  NotifWidget,
  NOTIF_TRANSITION_DURATION,
} from "../../notifs/NotifWidget";
import AstalNotifd from "gi://AstalNotifd";
import { Gtk } from "astal/gtk3";
import { bind } from "astal";

const notifd = AstalNotifd.get_default();

export default function NotifCentre() {
  const NotifWidgets = bind(notifd, "notifications").as((n) =>
    n.map(NotifWidget),
  );

  const NotifList = (
    <box spacing={8} vertical={true} className={"notifications"}>
      {NotifWidgets}
    </box>
  );

  return (
    <box className={"notif-centre"} vertical={true}>
      <centerbox
        className={"nc-header"}
        startWidget={<label label={"Notifications"} halign={Gtk.Align.START} />}
        endWidget={
          <button
            className={"clear-button"}
            halign={Gtk.Align.END}
            onClicked={() => {
              const notifs = notifd.get_notifications();

              for (const n of notifs) {
                notifd.get_notification(n.id).dismiss();
              }
            }}
          >
            <icon icon={"edit-delete-symbolic"} />
          </button>
        }
      />
      <scrollable
        widthRequest={320}
        heightRequest={550}
        hscroll={Gtk.PolicyType.NEVER}
        child={NotifList}
      ></scrollable>
    </box>
  );
}

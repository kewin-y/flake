// I LOVE TAKING FROM THE EXAMPLES!
const notifications = await Service.import("notifications");

/** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
function NotificationIcon({ app_entry, app_icon, image }) {
  if (image) {
    return Widget.Box({
      vpack: "center",
      className: "icon img",
      css: `background-image: url("${image}"); 
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;`,
    });
  }

  let icon = "dialog-information-symbolic";
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;

  if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry;

  return Widget.CenterBox({
    className: "icon",
    centerWidget: Widget.Icon({
      icon,
      size: 58,
      vpack: "center",
      hpack: "center",
    }),
  });
}

/** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
function Notification(n) {
  const icon = NotificationIcon(n);

  const title = Widget.Label({
    class_name: "title",
    justification: "center",
    hexpand: true,
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary,
    use_markup: true,
  });

  const body = Widget.Label({
    class_name: "body",
    hexpand: true,
    justification: "center",
    label: n.body.trim(),
    max_width_chars: 24,
    wrap: true,
  });

  const actions =
    n.actions.length > 0
      ? Widget.Box({
          class_name: "actions",
          children: n.actions.map(({ id, label }) =>
            Widget.Button({
              class_name: "action-button",
              on_clicked: () => {
                n.invoke(id);
                n.dismiss();
              },
              hexpand: true,
              child: Widget.Label(label),
            }),
          ),
        })
      : null;

  return Widget.EventBox(
    {
      attribute: { id: n.id },
      on_primary_click: n.dismiss,
    },
    Widget.Box({
      class_name: `notification ${n.urgency}`,
      children: [
        icon,
        Widget.Box({
          className: "content",
          vertical: true,
          children: [title, body, actions],
        }),
      ],
    }),
  );
}

export function NotificationPopup(monitor = 0) {
  const list = Widget.Box({
    vertical: true,
    className: "notifications",
    children: notifications.popups.map(Notification),
  });

  function onNotified(_, /** @type {number} */ id) {
    const n = notifications.getNotification(id);
    if (n) list.children = [...list.children, Notification(n)];
  }

  function onDismissed(_, /** @type {number} */ id) {
    list.children.find((n) => n.attribute.id === id)?.destroy();
  }

  list
    .hook(notifications, onNotified, "notified")
    .hook(notifications, onDismissed, "dismissed");

  return Widget.Window({
    monitor,
    name: `notifications${monitor}`,
    class_name: "notification-popups",
    anchor: ["top", "right"],
    child: list,
  });
}

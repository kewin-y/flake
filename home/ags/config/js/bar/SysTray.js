import Widget from "resource:///com/github/Aylur/ags/widget.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import Variable from "resource:///com/github/Aylur/ags/variable.js";

const tray = () =>
  Widget.Box({
    className: "tray",
    vertical: true,
    spacing: 4,
    children: SystemTray.bind("items").as((items) => {
      return items.map((item) =>
        Widget.Button({
          child: Widget.Icon({ binds: [["icon", item, "icon"]] }),
          on_primary_click: (_, event) => item.activate(event),
          on_secondary_click: (_, event) => item.openMenu(event),
          binds: [["tooltip-markup", item, "tooltip-markup"]],
        }),
      );
    }),
  });

export const SysTray = () => {
  const showSysTray = Variable(false);

  const trayRevealer = Widget.Revealer({
    revealChild: false,
    transition_duration: 100,
    transition: "slide_up",
    child: tray(),
    setup: (self) =>
      self.hook(showSysTray, () => {
        self.reveal_child = showSysTray.value;
      }),
  });

  const button = Widget.Button({
    class_name: "tray-button",
    child: Widget.Icon({
      class_name: "icon",
      icon: "pan-start-symbolic",
      setup: (self) =>
        self.hook(showSysTray, () =>
          self.toggleClassName("showing", showSysTray.value),
        ),
    }),
    onClicked: () => {
      showSysTray.setValue(!showSysTray.value);
    },
  });

  return Widget.Box({
    spacing: 8,
    vertical: true,
    children: [trayRevealer, button],
  });
};

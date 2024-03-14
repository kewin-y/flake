const CalBox = () =>
  Widget.Box({
    class_name: "cal-box",
    child: Widget.Calendar({
      class_name: "cal",
    }),
  });

export const Cal = (monitor = 0) =>
  Widget.Window({
    name: "cal-window",
    setup: (self) => self.keybind("Escape", () => App.closeWindow("cal-window")),
    monitor,
    visible: false,
    margins: [4, 4],
    anchor: ["left"],
    child: CalBox(),
  });

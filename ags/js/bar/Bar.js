import { Workspaces } from "./Workspaces.js";
import { Clock } from "./Clock.js";
import { SysTray } from "./SysTray.js";
import { ControlButton } from "./ControlButton.js";
import { BatteryLabel } from "./BatteryLabel.js";
import { AppLauncherButton } from "./AppLauncherButton.js";

const Start = () =>
  Widget.Box({
    hpack: "start",
    css: "margin: 0.2rem 0.8rem",
    spacing: 8,
    children: [AppLauncherButton(), SysTray()],
  });

const Center = () =>
  Widget.Box({
    css: "margin: 0.2rem 0.8rem",
    children: [Workspaces()],
  });

const End = () =>
  Widget.Box({
    hpack: "end",
    css: "margin: 0.2rem 0.8rem",
    spacing: 8,
    children: [BatteryLabel(), Clock(), ControlButton()],
  });

export const Bar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["right", "bottom", "left"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      class_name: "cbox",
      start_widget: Start(),
      center_widget: Center(),
      end_widget: End(),
    }),
  });

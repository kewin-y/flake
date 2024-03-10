import { Workspaces } from "./Workspaces.js";
import { Clock } from "./Clock.js";
import { SysTray } from "./SysTray.js";
import { ControlButton } from "./ControlButton.js";

const Left = () =>
  Widget.Box({
    vertical: true,
    vpack: "start",
    css: "margin: 0.7em 0.2em",
    spacing: 8,
    children: [Workspaces()],
  });
const Center = () =>
  Widget.Box({
    vertical: true,
    css: "margin: 0.7em 0.2em",
    spacing: 8,
    children: [Clock()],
  });
const Right = () =>
  Widget.Box({
    css: "margin: 0.7em 0.2em",
    vertical: true,
    vpack: "end",
    spacing: 8,
    children: [
      SysTray(),
      ControlButton(),
    ],
  });
export const Bar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "bottom", "left"],
    exclusivity: "exclusive",
    margins: [4, 0, 4, 4],
    child: Widget.CenterBox({
      class_name: "cbox",
      vertical: true,
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

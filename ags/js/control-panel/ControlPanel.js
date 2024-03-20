import { PowerBox } from "./PowerBox.js";
import { Speaker, Microphone } from "./Sliders.js";
import { Wifi } from "./WifiWidget.js";
import { uptime } from "../Variables.js";

// Wifi, bluetooth (if i ever use it), battery (if i use this on my laptop)
const TopBox = () =>
  Widget.Box({
    children: [Wifi()],
  });

// Volume sliders, brightness slider?
const MiddleBox = () =>
  Widget.Box({
    spacing: 12,
    vertical: true,
    children: [Speaker(), Microphone()],
  });

const BottomBox = () =>
  Widget.Box({
    spacing: 12,
    children: [
      PowerBox(),
      Widget.Label({
        hexpand: true,
        className: "uptime",
        label: uptime.bind().as((value) => value.toString()),
      }),
    ],
  });


export const ControlPanel = () =>
  Widget.Window({
    name: "control-panel",
    anchor: ["bottom", "left"],
    visible: false,
    setup: (self) => self.keybind("Escape", () => App.closeWindow("control-panel")),
    child: Widget.Box({
      className: "control-box",
      spacing: 12,
      vertical: true,
      children: [TopBox(), MiddleBox(), BottomBox()],
    }),
  });

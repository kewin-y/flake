const audio = await Service.import("audio")
const network = await Service.import("network")

import { speakerIcon } from "../Variables.js";

const VolumeIndicator = () =>
  Widget.Icon({
    className: "icon volume",
  }).hook(
    audio,
    (self) => {
      self.icon = speakerIcon();
    },
    "speaker-changed",
  );

/** @param {'wifi' | 'wired'} type */
const NetworkIcon = (type) =>
  Widget.Icon({
    className: "icon network",
    icon: network[type].bind("icon_name"),
  });

const NetworkIndicator = () =>
  Widget.Stack({
    homogeneous: false,
    children: {
      wifi: NetworkIcon("wifi"),
      wired: NetworkIcon("wired"),
    },
    shown: network.bind("primary").as((p) => p || "wifi"),
  });

const PowerIcon = () =>
  Widget.Icon({
    className: "icon power",
    icon: "system-shutdown-symbolic",
  });

export const ControlButton = () =>
  Widget.Button({
    class_name: "control-button",
    onClicked: () => {
      App.toggleWindow("control-panel");
    },
    child: Widget.Box({
      vertical: true,
      spacing: 12,
      children: [NetworkIndicator(), VolumeIndicator(), PowerIcon()],
    }),
  });

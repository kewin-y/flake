const battery = await Service.import("battery");

export const BatteryLabel = () => {
  const batteryPercent = battery
    .bind("percent")
    .as((p) => (p > 0 ? p / 100 : 0));
  return Widget.Box({
    className: battery
      .bind("charging")
      .as((ch) => (ch ? "battery-label charging" : "battery-label")),
    visible: battery.bind("available"),
    children: [
      Widget.Box({
        className: "battery-bulb",
        hexpand: false,
      }),
      Widget.LevelBar({
        widthRequest: 40,
        value: batteryPercent,
        inverted: true,
      }),
    ],
  });
};

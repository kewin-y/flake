const battery = await Service.import("battery");

function notifyBattery() {
  print(battery.icon_name)
  Utils.notify({
    summary: "Battery",
    body: `${battery.percent}%`,
  })

};

export function BatteryButton() {
  const batteryPercent = battery.bind("percent").as(p => p > 0 ? p / 100 : 0);
	return Widget.Button({
    visible: battery.bind("available"),
    onClicked: notifyBattery,
		className: "battery-button",
		child: Widget.Box({
			vertical: true,
			children: [
				Widget.Box({
					className: "battery-bulb",
					hexpand: false,
				}),
				Widget.LevelBar({
					vertical: true,
					heightRequest: 30,
					value: batteryPercent,
					inverted: true,
				}),
			]
		}),
	});
};


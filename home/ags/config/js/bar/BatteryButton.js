const battery = await Service.import("battery");

export function BatteryButton() {
	const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0);
	return Widget.Button({
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
					value: value,
					inverted: true,
				}),
			]
		}),
	});
};


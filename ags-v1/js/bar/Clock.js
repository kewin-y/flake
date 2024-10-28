import { execAsync } from "astal/process ff";

export const Clock = () =>
  Widget.Box({
    class_name: "clock",
    spacing: 12,
    children: [
      Widget.Label({
        setup: (self) =>
          self.poll(1000, (self) =>
            execAsync(["date", "+%H:%M"]).then((date) => (self.label = date)),
          ),
      }),
    ],
  });

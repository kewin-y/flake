const LOCKCMD = `waylock -init-color 0x111517 -input-color 0x5a7d82 -fail-color 0xa54242`;

/**
 * @param {string} cmd
 * @param {string} icon
 */
const PowerButton = (cmd, icon) =>
  Widget.Button({
    vexpand: true,
    hexpand: true,
    onClicked: () => Utils.execAsync(cmd),
    child: Widget.Icon({ class_name: "icon", icon: icon }),
  });

export const PowerBox = () =>
  Widget.Box({
    class_name: "power-box",
    vexpand: true,
    hexpand: true,
    spacing: 8,
    children: [
      PowerButton("systemctl poweroff", "system-shutdown-symbolic"),
      PowerButton("systemctl reboot", "system-reboot-symbolic"),
      PowerButton(`${LOCKCMD}`, "system-lock-screen-symbolic"),
      PowerButton(
        `bash -c "loginctl terminate-user $USER"`,
        "application-exit-symbolic",
      ),
    ],
  });

import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

const LOCKCMD = `waylock -init-color 0x111517 -input-color 0x5a7d82 -fail-color 0xa54242`;

/**
 * @param {string} cmd
 */
const runCmd = (cmd) => {
  App.closeWindow("control-panel");
  execAsync(cmd);
};

/**
 * @param {string} cmd
 * @param {string} icon
 */
const PowerButton = (cmd, icon) =>
  Widget.Button({
    onClicked: () => runCmd(cmd),
    child: Widget.Icon({ class_name: "icon", icon: icon }),
  });

export const PowerBox = () =>
  Widget.Box({
    class_name: "power-box",
    hpack: "start", // Im too lazy bro im just putting it here...
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

import { execAsync } from "astal/process";
import { USER } from "../../../shared/constants";
import { Gtk } from "astal/gtk3";

type PowerButtonProps = { cmd: string; icon: string };
function PowerButton({ cmd, icon }: PowerButtonProps) {
  return (
    <button
      onClicked={() => execAsync(cmd)}
      heightRequest={20}
      widthRequest={20}
    >
      <icon icon={icon} css="font-size: 14px" />
    </button>
  );
}

export default function PowerMenu() {
  return (
    <centerbox
      className={"power-menu"}
      start_widget={<label halign={Gtk.Align.START} label={USER} />}
      endWidget={
        <box className={"pm-buttons"} halign={Gtk.Align.END} spacing={8}>
          <PowerButton cmd="hyprlock" icon="system-lock-screen-symbolic" />
          <PowerButton
            cmd={`bash -c "loginctl terminate-user $USER"`}
            icon="application-exit-symbolic"
          />
          <PowerButton cmd="systemctl reboot" icon="system-reboot-symbolic" />
          <PowerButton
            cmd="systemctl poweroff"
            icon="system-shutdown-symbolic"
          />
        </box>
      }
    />
  );
}

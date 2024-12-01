import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";
import { Gtk } from "astal/gtk3";
import Pango from "gi://Pango";

export default function Clients() {
  const hypr = Hyprland.get_default();
  return (
    <box
      className={"clients"}
      spacing={4}
      hexpand={true}
      setup={(self) => {
        self.hook(hypr, "event", () => {
          const activeWorkspace = hypr.focused_workspace;
          self.set_children(
            activeWorkspace.get_clients().map((client) => (
              <button
                className={bind(hypr, "focusedClient").as((focusedClient) =>
                  focusedClient?.pid === client.pid ? "focused" : "",
                )}
                onClick={() => client.focus()}
              >
                <box spacing={8}>
                  <icon
                    halign={Gtk.Align.CENTER}
                    icon={bind(client, "class")}
                    css={"font-size: 16px;"}
                  />
                  <label
                    label={bind(client, "title")}
                    max_width_chars={18}
                    ellipsize={Pango.EllipsizeMode.END}
                  />
                </box>
              </button>
            )),
          );
        });
      }}
    ></box>
  );
}

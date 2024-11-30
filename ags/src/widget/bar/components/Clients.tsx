import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";

export default function Clients() {
  const hypr = Hyprland.get_default();
  return (
    <box className={"clients"} spacing={4} hexpand={true}>
      {bind(hypr, "clients").as((clients) =>
        clients.slice(0, 10).map((client) => (
          <button
            className={bind(hypr, "focusedClient").as((focusedClient) =>
              focusedClient?.pid === client.pid ? "focused" : "",
            )}
            onClick={() => client.focus()}
          >
            <label label={bind(client, "title")} />
          </button>
        )),
      )}
    </box>
  );
}

import { Astal, Gtk } from "astal/gtk3";
import Mpris from "gi://AstalMpris";
import { bind } from "astal";

function Player({ player }: { player: Mpris.Player | null }) {
  return (
    <box className={"media-player"} hexpand>
      {player ? (
        <box className={"cover-art"} />
      ) : (
        <centerbox
          className={"music-icon"}
          centerWidget={
            <icon
              icon="emblem-music-symbolic"
              css={"font-size: 38px;"}
              valign={Gtk.Align.CENTER}
              halign={Gtk.Align.CENTER}
            />
          }
        />
      )}
    </box>
  );
}

export default function Media() {
  const mpris = Mpris.get_default();
  return (
    <box>
      {bind(mpris, "players").as((players) => (
        <Player player={players[0]} />
      ))}
    </box>
  );
}

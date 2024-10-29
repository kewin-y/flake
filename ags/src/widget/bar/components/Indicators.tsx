import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import { bind } from "astal";

export default function Indicators() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;
  const { wifi } = Network.get_default();
  return <button>
    <box spacing={8}>
      <icon icon={bind(speaker, "volumeIcon")}/>
      <icon icon={bind(wifi, "iconName")}/>
    </box>
  </button>;
}

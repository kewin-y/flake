import Wp from "gi://AstalWp";
import { bind } from "astal";
import { togglePopupWindow } from "../../PopupWindow";
import WifiIcon from "../../../shared/WifiIcon";

export default function Indicators() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <button className="indicators" onClicked={() => togglePopupWindow("panel")}>
      <box spacing={8}>
        <icon icon={bind(speaker, "volumeIcon")} css={"font-size: 13px"} />
        {WifiIcon()}
      </box>
    </button>
  );
}

import Network from "gi://AstalNetwork";
import { bind } from "astal";

export default function WifiIcon() {
  const network = Network.get_default();
  const { wifi, wired } = network;

  return bind(network, "primary").as((n) => {
    if (n === Network.Primary.WIRED) {
      return <icon icon={bind(wired, "iconName")} />;
    } else if (n === Network.Primary.WIFI) {
      return <icon icon={bind(wifi, "iconName")} />;
    } else {
      // TODO: Find a better icon for this (unknown network)
      return <icon icon={"dialog-information-symbolic"} />;
    }
  });
}
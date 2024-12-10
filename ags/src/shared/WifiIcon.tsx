import Network from "gi://AstalNetwork";
import { bind, Variable } from "astal";

export default function WifiIcon() {
  const network = Network.get_default();
  const { wifi, wired } = network;

  const wifiIcon = Variable.derive(
    [bind(network, "primary"), bind(wired, "iconName"), bind(wifi, "iconName")],
    (primary, wiredIcon, wifiIcon) => {
      switch (primary) {
        case Network.Primary.WIRED:
          return wiredIcon
        case Network.Primary.WIFI:
          return wifiIcon
        case Network.Primary.UNKNOWN:
          return "network-wireless-disabled-symbolic"
        default:
          return "network-wireless-disabled-symbolic"
      }
    },
  );

  return wifiIcon
}

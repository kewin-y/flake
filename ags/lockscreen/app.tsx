import Lock from "gi://GtkSessionLock";
import { App } from "astal/gtk3";

function main() {
  print("Hello");
}
App.start({
  instanceName: "lockscreen",
  main,
});

import { Bar } from "./js/bar/Bar.js";
import { NotificationPopup } from "./js/notifs/NotificationPopup.js";
import { controlpanel } from "./js/control-panel/ControlPanel.js";
import { applauncher } from "./js/app-launcher/AppLauncher.js";
// import { ImageWindow } from "./js/image-window/ImageWindow.js";

const scss = `${App.configDir}/scss/style.scss`;
const css = "/tmp/ags.css";

Utils.exec(`sassc ${scss} ${css}`);

App.config({
  style: css,
  closeWindowDelay: {
    control_panel: 300,
    app_launcher: 300,
  },
  windows: [
    Bar(),
    // ImageWindow(),
    NotificationPopup(),
    controlpanel,
    applauncher,
  ],
});

import { Bar } from "./js/bar/Bar.js";
import { Cal } from "./js/calendar/Cal.js";
import { NotificationPopup } from "./js/notifs/NotificationPopup.js";
import { ImageWindow } from "./js/image-window/ImageWindow.js";
import { ControlPanel } from "./js/control-panel/ControlPanel.js";

const scss = `${App.configDir}/scss/style.scss`;
const css = `${App.configDir}/style.css`;

print(`${App.configDir}`);

Utils.exec(`sassc ${scss} ${css}`);

App.config({
  style: css,
  windows: [
    Bar(),
    Cal(),
    ImageWindow(),
    ControlPanel(),
    NotificationPopup(),
  ],
});

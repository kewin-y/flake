import { PopupWindow, togglePopupWindow } from "../../lib/PopupWindow";
import { App, Astal, Gtk, Widget } from "astal/gtk3";
import Apps from "gi://AstalApps";

const WINDOW_NAME = "app-launcher";

function ApplicationItem(application: Apps.Application) {
  return (
    <button
      name={application.name}
      onClicked={() => {
        togglePopupWindow(WINDOW_NAME);
        application.launch();
      }}
    >
      <box>
        <icon icon={application.iconName} icon_size={26} />
        <label
          className="title"
          label={application.name}
          xalign={0}
          valign={Gtk.Align.CENTER}
        ></label>
      </box>
    </button>
  );
}

type InnerProps = { width: number; height: number; spacing: number };

// Idiot
// This works for me since I barely have any apps installed
// TODO: Fix this garbage
function Inner({ width, height, spacing }: InnerProps) {
  const apps = Apps.Apps.new();

  const applications = apps.fuzzy_query("");
  const applicationWidgets = applications.map(ApplicationItem);

  const List = new Widget.Box({
    vertical: true,
    spacing: spacing,
    children: applicationWidgets,
  });

  const Search = new Widget.Entry({
    className: "entry",
    hexpand: true,
    css: `margin-bottom: ${spacing}px;`,
    onActivate: (self) => {
      const results = apps.fuzzy_query(self.text);
      if (results[0]) {
        togglePopupWindow(WINDOW_NAME);
        results[0].launch();
      }
    },
    // This is kind of stupid
    onChanged: (self) => {
      const results = apps.fuzzy_query(self.text).map((itm) => itm.name);
      applicationWidgets.forEach((itm) => {
        itm.set_visible(results.includes(itm.name));
      });
    },
  });

  App.connect("window-toggled", (_, win) => {
    if (win.name === WINDOW_NAME) {
      Search.set_text("");
      Search.grab_focus();
    }
  });

  return (
    <box className={"al-out-box"}>
      <box
        className={"al-in-box"}
        vertical={true}
        children={[
          Search,
          <scrollable
            heightRequest={height}
            widthRequest={width}
            hscroll={Gtk.PolicyType.NEVER}
            child={List}
          ></scrollable>,
        ]}
      ></box>
    </box>
  );
}

export default function Launcher() {
  const anchor = Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT;
  return (
    <PopupWindow
      name={WINDOW_NAME}
      application={App}
      transition={Gtk.RevealerTransitionType.SLIDE_UP}
      duration={300}
      anchor={anchor}
      margin={4}
      keymode={Astal.Keymode.EXCLUSIVE}
    >
      <box>
        <Inner width={300} height={380} spacing={12} />
      </box>
    </PopupWindow>
  );
}

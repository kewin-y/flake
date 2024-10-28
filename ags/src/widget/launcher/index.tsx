import { PopupWindow, togglePopupWindow } from "../../lib/PopupWindow";
import { App, Astal, Gtk } from "astal/gtk3";
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
// Also for some reason fuzzy_match() does not exist
// TODO: Fix this garbage
function Inner({ width, height, spacing }: InnerProps) {
  const apps = Apps.Apps.new();

  const applications = apps.fuzzy_query("");
  const applicationBtns = applications.map(ApplicationItem);

  const List = (
    <box vertical={true} spacing={spacing}>
      {applicationBtns}
    </box>
  );

  const Search = (
    <entry
      className={"entry"}
      hexpand={true}
      css={`
        margin-bottom: ${spacing}px;
      `}
      onActivate={(self) => {
        const results = apps.fuzzy_query(self.text);
        if (results[0]) {
          togglePopupWindow(WINDOW_NAME);
          results[0].launch();
        }
      }}
      onChanged={(self) => {
        const results = apps.fuzzy_query(self.text).map((itm) => itm.name);
        applicationBtns.forEach((itm) => {
          itm.set_visible(results.includes(itm.name));
        });
      }}
    />
  );

  App.connect("window-toggled", (_, win) => {
    if (win.name === WINDOW_NAME) {
      (Search as Gtk.Entry).set_text("");
      (Search as Gtk.Entry).grab_focus();
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
  const anchor = Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT;
  return (
    <PopupWindow
      name={WINDOW_NAME}
      application={App}
      transition={Gtk.RevealerTransitionType.SLIDE_UP}
      duration={300}
      anchor={anchor}
      margin={4}
      keymode={Astal.Keymode.EXCLUSIVE}
      monitor={0}
    >
      <box>
        <Inner width={300} height={380} spacing={12} />
      </box>
    </PopupWindow>
  );
}

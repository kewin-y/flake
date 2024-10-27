import { PopupWindow, togglePopupWindow } from "../../lib/PopupWindow";
import { App, Astal, Gtk } from "astal/gtk3";
import Apps from "gi://AstalApps";

const WINDOW_NAME = "app-launcher";

function ApplicationItem(application: Apps.Application) {
  return (
    <button
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

// Ermm .. This way of doing things is slow especially when you type fast 🤓
function Inner({ width, height, spacing }: InnerProps) {
  const apps = Apps.Apps.new();
  const applicationList = apps.fuzzy_query("").map(ApplicationItem);

  const List = () => (
    <box vertical={true} children={applicationList} spacing={spacing}></box>
  );

  const Search = () => (
    <entry
      className={"entry"}
      hexpand={true}
      css={`
        margin-bottom: ${spacing}px;
      `}
      onChanged={(e) => { }}
    ></entry>
  );

  return (
    <box className={"al-out-box"}>
      <box className={"al-in-box"} vertical={true}>
        <Search />
        <scrollable
          heightRequest={height}
          widthRequest={width}
          hscroll={Gtk.PolicyType.NEVER}
        >
          <List />
        </scrollable>
      </box>
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
    >
      <box>
        <Inner width={300} height={380} spacing={12} />
      </box>
    </PopupWindow>
  );
}

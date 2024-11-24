import { PopupWindow, togglePopupWindow } from "../PopupWindow";
import { App, Astal, Gtk } from "astal/gtk3";
import Apps from "gi://AstalApps";
import PowerMenu from "./components/PowerMenu";
import Uptime from "./components/Uptime";

export const WINDOW_NAME = "app-launcher";

function ApplicationItem(application: Apps.Application) {
  return (
    <button
      className="app-item"
      heightRequest={38}
      onClicked={() => {
        togglePopupWindow(WINDOW_NAME);
        application.launch();
      }}
    >
      <box>
        <icon icon={application.iconName} css={"font-size: 26px"} />
        <label
          className="title"
          label={application.name}
          valign={Gtk.Align.CENTER}
        ></label>
      </box>
    </button>
  );
}

type InnerProps = { width: number; height: number; spacing: number };

function InnerLauncher({ width, height, spacing }: InnerProps) {
  const apps = Apps.Apps.new();

  const applications = apps.fuzzy_query("");
  const applicationBtns = applications.map(ApplicationItem);

  const applicationMap: Map<Apps.Application, Gtk.Widget> = new Map();

  for (let i = 0; i < applications.length; i++) {
    applicationMap.set(applications[i], applicationBtns[i]);
  }

  const List = (
    <box vertical={true} spacing={spacing}>
      {applicationBtns}
    </box>
  );

  function launch() {
    for (const application of applicationMap.keys()) {
      if (applicationMap.get(application)?.visible) {
        togglePopupWindow(WINDOW_NAME);
        application.launch();
        return;
      }
    }
  }

  const Search = (
    <entry
      className="search-entry"
      heightRequest={38}
      hexpand={true}
      onActivate={() => launch()}
      onChanged={(self) => {
        for (const application of applicationMap.keys()) {
          if (apps.fuzzy_score(self.text, application) > apps.min_score) {
            applicationMap.get(application)?.set_visible(true);
          } else {
            applicationMap.get(application)?.set_visible(false);
          }
        }
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
    <box className={"launcher-box"} vertical={true}>
      <Uptime />
      <box>
        <centerbox
          className={"power-menu"}
          vertical={true}
          startWidget={
            <button
              widthRequest={38}
              heightRequest={38}
              tooltipText={"Search Apps"}
              valign={Gtk.Align.START}
              child={<icon icon="system-search-symbolic" />}
              onClicked={() => launch()}
              className={"search-icon"}
              css="font-size: 16px"
            />
          }
          endWidget={<PowerMenu />}
        />
        <box
          vertical={true}
          spacing={spacing}
          className={"apps"}
          children={[
            Search,
            <scrollable
              widthRequest={width}
              heightRequest={height}
              hscroll={Gtk.PolicyType.NEVER}
              child={List}
            ></scrollable>,
          ]}
        ></box>
      </box>
    </box>
  );
}

export default function Launcher() {
  const anchor = Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.LEFT;
  return (
    <PopupWindow
      name={WINDOW_NAME}
      transition={Gtk.RevealerTransitionType.SLIDE_UP}
      anchor={anchor}
      keymode={Astal.Keymode.EXCLUSIVE}
      monitor={0}
    >
      <box>
        <InnerLauncher width={300} height={380} spacing={8} />
      </box>
    </PopupWindow>
  );
}

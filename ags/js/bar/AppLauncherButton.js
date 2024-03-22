const NIXOS_ICON = `${App.configDir}/assets/nix-snowflake.svg`;

export const AppLauncherButton = () =>
  Widget.Button({
    className: "app-l-button",
    onClicked: () => App.toggleWindow("app_launcher"),
    child: Widget.Icon({
      icon: NIXOS_ICON,
      size: 20,
    }),
  });

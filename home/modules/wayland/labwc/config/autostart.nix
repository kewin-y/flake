{
  pkgs,
  config,
  ...
}: {
  home.file.".config/labwc/autostart".text = ''
    swaybg -i ${config.wallpaper} -m fill >/dev/null 2>&1 &
    mako >/dev/null 2>&1 &
    waybar >/dev/null 2>&1 &
    ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
  '';
}

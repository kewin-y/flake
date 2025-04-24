{
  lib,
  config,
  ...
}: {
  home.file.".config/labwc/environment".text = ''
    XDG_CURRENT_DESKTOP=labwc
    MOZ_GTK_TITLEBAR_DECORATION=system
    ELECTRON_OZONE_PLATFORM_HINT=wayland
  '';
}

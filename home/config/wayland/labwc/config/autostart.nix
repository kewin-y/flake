{
  pkgs,
  config,
  ...
}: {
  home.file.".config/labwc/autostart".text = let
    lock = import ../scripts/waylock.nix {
      inherit pkgs;
      inherit config;
    };
  in ''
    swaybg -i ${config.wallpaper} -m fill >/dev/null 2>&1 &

    ${pkgs.wlsunset}/bin/wlsunset -l 43.7 -L -79.4 -t 3500 -T 6500 &

    ${pkgs.swayidle}/bin/swayidle -w \
      timeout 300 '${lock}/bin/lock' \
      timeout 330 '${pkgs.wlopm}/bin/wlopm --off \*' \
      resume '${pkgs.wlopm}/bin/wlopm --on \*' \
      before-sleep '${lock}/bin/lock' >/dev/null 2>&1 &

    mako >/dev/null 2>&1 &
    waybar >/dev/null 2>&1 &
    ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false
    ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1
  '';
}

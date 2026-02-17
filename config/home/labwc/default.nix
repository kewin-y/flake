{pkgs, ...}: {
    imports = [
      ./autostart.nix
      ./environment.nix
      ./menu.nix
      ./rc.nix
      ./themerc.nix
    ];
    environment.systemPackages = [
        pkgs.labwc
    ];
}

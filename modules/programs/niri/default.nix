{
    globals,
    config,
    pkgs,
    ...
}: {
    # Let the module configure the portals (for now)
    programs.niri.enable = true;

    systemd.user.services.swaybg = {
        description = "Swaybg";
        partOf = ["niri.service"];
        after = ["niri.service"];
        requisite = ["niri.service"];
        wantedBy = ["niri.service"];

        serviceConfig = {
            ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.kevin.wallpaper} -m fill";
            Restart = "on-failure";
        };
    };

    hjem.users.${globals.user}.files = {
        ".config/niri/config.kdl".source = import ./config.kdl.nix {
            inherit pkgs;
            base16Scheme = globals.base16Scheme;
        };
    };
}

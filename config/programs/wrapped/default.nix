# TODO: Add these packages to flake outputs and manually add them to environment.systemPackages
{
    pkgs,
    globals,
    ...
}: let
    base16Scheme = globals.base16Scheme;
    base16SchemeNoHashtag = globals.base16SchemeNoHashtag;

    packages = {
        tmux = pkgs.callPackage ./tmux.nix {inherit base16Scheme;};
        obsidian = pkgs.callPackage ./obsidian.nix {};
        yazi = pkgs.callPackage ./yazi {};
        foot = pkgs.callPackage ./foot {inherit base16SchemeNoHashtag;};
        swaylock = pkgs.callPackage ./swaylock {inherit base16SchemeNoHashtag;};
        waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
        mako = pkgs.callPackage ./mako {inherit base16Scheme;};
        fuzzel = pkgs.callPackage ./fuzzel {inherit base16Scheme;};
    };
in {
    environment.systemPackages = builtins.attrValues packages;

    # Since we wrap the package, we need to manually set a systemd service
    systemd.user.services.waybar = {
        description = "Waybar";
        wantedBy = ["niri.service"];
        after = ["niri.service"];
        serviceConfig = {
            ExecStart = "${packages.waybar}/bin/waybar";
            Restart = "on-failure";
        };
    };

    systemd.user.services.mako = {
        description = "Mako";
        wantedBy = ["niri.service"];
        after = ["niri.service"];
        serviceConfig = {
            ExecStart = "${packages.mako}/bin/mako";
            Restart = "on-failure";
        };
    };
}

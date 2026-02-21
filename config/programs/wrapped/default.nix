# TODO: Add these packages to flake outputs and manually add them to environment.systemPackages
{
    pkgs,
    globals,
    ...
}: let
    base16Scheme = globals.base16Scheme;
    base16SchemeNoHashtag = globals.base16SchemeNoHashtag;

    packages = {
        obsidian = pkgs.callPackage ./obsidian.nix {};
        yazi = pkgs.callPackage ./yazi {};
        foot = pkgs.callPackage ./foot {inherit base16Scheme;};
        swaylock = pkgs.callPackage ./swaylock {inherit base16SchemeNoHashtag;};
        waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
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
}

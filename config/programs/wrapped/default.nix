{
    pkgs,
    globals,
    ...
}: let
    base16Scheme = globals.base16Scheme;
    base16SchemeNoHashtag = globals.base16SchemeNoHashtag;

    packages = {
        obsidian = pkgs.callPackage ./obsidian.nix {};
        waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
        foot = pkgs.callPackage ./foot {inherit base16Scheme;};
        swaylock = pkgs.callPackage ./swaylock {inherit base16SchemeNoHashtag;};
        yazi = pkgs.callPackage ./yazi {};
    };
in {
    environment.systemPackages = builtins.attrValues packages;
}

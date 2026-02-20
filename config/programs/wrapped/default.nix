{
    pkgs,
    globals,
    ...
}: let
    base16Scheme = globals.base16Scheme;

    packages = {
        obsidian = pkgs.callPackage ./obsidian.nix {};
        waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
        foot = pkgs.callPackage ./foot {inherit base16Scheme;};
    };
in {
    environment.systemPackages = builtins.attrValues packages;
}

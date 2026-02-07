{pkgs, ...}: let
    packages = {
        obsidian = pkgs.callPackage ./obsidian.nix {};
    };
in {
    environment.systemPackages = builtins.attrValues packages;
}

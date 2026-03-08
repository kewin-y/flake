# TODO: Add these packages to flake outputs and manually add them to environment.systemPackages
{
    pkgs,
    globals,
}: let
    base16Scheme = globals.base16Scheme;
    base16SchemeNoHashtag = globals.base16SchemeNoHashtag;

    wrapped = {
        tmux = pkgs.callPackage ./tmux.nix {inherit base16Scheme;};
        yazi = pkgs.callPackage ./yazi {};
        foot = pkgs.callPackage ./foot {inherit base16SchemeNoHashtag;};
        swaylock = pkgs.callPackage ./swaylock {inherit base16SchemeNoHashtag;};
        waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
        mako = pkgs.callPackage ./mako {inherit base16Scheme;};
        fuzzel = pkgs.callPackage ./fuzzel {inherit base16Scheme;};
        neovim = pkgs.callPackage ./neovim {inherit base16Scheme;};
    };
in
    wrapped


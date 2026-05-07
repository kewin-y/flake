{
  pkgs,
  theme,
}: let
  base16Scheme = theme.hashtag;
  base16SchemeNoHashtag= theme.noHashtag;

  wrapped = {
    tmux = pkgs.callPackage ./tmux.nix {inherit base16Scheme;};
    yazi = pkgs.callPackage ./yazi {};
    foot = pkgs.callPackage ./foot {inherit base16SchemeNoHashtag;};
    swaylock = pkgs.callPackage ./swaylock {inherit base16SchemeNoHashtag;};
    waybar = pkgs.callPackage ./waybar {inherit base16Scheme;};
    mako = pkgs.callPackage ./mako {inherit base16Scheme;};
    fuzzel = pkgs.callPackage ./fuzzel {inherit base16Scheme;};
    neovim = pkgs.callPackage ./neovim {};
  };
in
  wrapped

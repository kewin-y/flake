{
    pkgs,
    base16SchemeNoHashtag,
}: let
    config = import ./config.nix {inherit pkgs base16SchemeNoHashtag;};
in
    pkgs.symlinkJoin {
        name = "swaylock-wrapped";
        paths = [
            pkgs.swaylock
        ];

        nativeBuildInputs = [pkgs.makeWrapper];

        postBuild = ''
            wrapProgram $out/bin/swaylock --add-flags "-C ${config}"
        '';
    }

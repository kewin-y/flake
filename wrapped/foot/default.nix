{
    pkgs,
    base16SchemeNoHashtag,
}: let
    config = import ./config.nix {inherit pkgs base16SchemeNoHashtag;};
in
    pkgs.symlinkJoin {
        name = "foot-wrapped";

        paths = [
            pkgs.foot
        ];

        nativeBuildInputs = [pkgs.makeWrapper];

        postBuild = ''
            wrapProgram $out/bin/foot --add-flags "-c ${config}"
        '';
    }

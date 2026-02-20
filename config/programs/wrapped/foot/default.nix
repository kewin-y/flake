{
    pkgs,
    base16Scheme,
}: let
    config = import ./config.nix {inherit pkgs base16Scheme;};
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

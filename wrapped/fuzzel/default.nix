{
    pkgs,
    base16Scheme,
}: let
    config = import ./fuzzel.ini.nix {inherit pkgs base16Scheme;};
in
    pkgs.symlinkJoin {
        name = "fuzzel-wrapped";
        paths = [pkgs.fuzzel];
        nativeBuildInputs = [pkgs.makeWrapper];
        postBuild = ''
            wrapProgram $out/bin/fuzzel --add-flags "--config ${config}"
        '';
    }

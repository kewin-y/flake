{
    pkgs,
    base16Scheme,
}: let
    style = import ./style.nix {inherit pkgs base16Scheme;};
    config = import ./config.nix pkgs;
in
    pkgs.symlinkJoin {
        name = "waybar-wrapped";
        paths = [
            pkgs.waybar
        ];

        nativeBuildInputs = [pkgs.makeWrapper];

        postBuild = ''
            wrapProgram $out/bin/waybar --add-flags "-c ${config} -s ${style}"
        '';
    }

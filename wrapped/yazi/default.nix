{pkgs}: let
    yaziConfig = pkgs.symlinkJoin {
        name = "yazi-config";
        paths = [
            (import ./yazi.toml.nix pkgs)
        ];
    };
in
    pkgs.symlinkJoin {
        name = "yazi-wrapped";
        paths = [
            pkgs.yazi
        ];

        nativeBuildInputs = [pkgs.makeWrapper];

        postBuild = ''
            wrapProgram $out/bin/yazi --set YAZI_CONFIG_HOME ${yaziConfig}/yazi
        '';
    }

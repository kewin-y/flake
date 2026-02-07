{pkgs}:
pkgs.symlinkJoin {
    name = "obsidian-wrapped";
    paths = [
        pkgs.obsidian
    ];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
        wrapProgram $out/bin/obsidian --add-flags "--disable-gpu"
    '';
}

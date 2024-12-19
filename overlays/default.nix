{pkgs, ...}: {
  nixpkgs.overlays = [
    # Im gonna freak out
    (final: prev: {
      siji = prev.siji.overrideAttrs (oldAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "mxkrsv";
          repo = "siji-ng";
          rev = "59ddd620276d07f704b8471bac577d34636e28ca";
          hash = "sha256-E1TBYqRjuITAoyc1a2s+UILE21Dlk6SrBwqXqAx4Wo8=";
        };
        nativeBuildInputs =
          oldAttrs.nativeBuildInputs
          ++ [
            pkgs.xorg.bdftopcf
            pkgs.python3
          ];
        buildPhase = ''
          bdftopcf siji.bdf -o siji.pcf
          python3 bin/otb1cli.py -o siji.otb siji.bdf
        '';
        installPhase = ''
          mkdir -p "$out/share/fonts/misc"

          install -m 644 -D *.otb *.pcf -t "$out/share/fonts/misc"
          mkfontdir "$out/share/fonts/misc"
        '';
        postInstallPhase = "";
        outputs = [
          "out"
        ];
      });
    })
  ];
}

{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      siji = prev.siji.override {
        src = pkgs.fetchFromGitHub {
          owner = "mxkrsv";
          repo = "siji-ng";
          rev = "59ddd620276d07f704b8471bac577d34636e28ca";
          hash = "sha256-E1TBYqRjuITAoyc1a2s+UILE21Dlk6SrBwqXqAx4Wo8=";
        };
      };
    })
  ];
}

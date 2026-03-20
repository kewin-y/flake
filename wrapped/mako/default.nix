{
  pkgs,
  base16Scheme,
}: let
  config = import ./config.nix {inherit pkgs base16Scheme;};
in
  pkgs.symlinkJoin {
    name = "mako-wrapped";
    paths = [pkgs.mako];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/mako --add-flags "-c ${config}"
    '';
  }

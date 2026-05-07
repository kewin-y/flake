{
  themeName,
  lib,
}: let
  inherit (builtins) attrNames readDir elem;

  availableThemes = attrNames (readDir ./themes);
  themeExists = elem "${themeName}.nix" availableThemes;
  themeError = "Theme '${themeName}' not found";
in
  assert themeExists || throw themeError; rec {
    hashtag = import ./themes/${themeName}.nix;
    noHashtag = let
      inherit (lib) mapAttrs;
      inherit (lib.strings) removePrefix;
    in
      mapAttrs (name: value: removePrefix "#" value) hashtag;
  }

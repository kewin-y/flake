{
    theme,
    pkgs,
}: let
    inherit (pkgs) lib;
    inherit (builtins) attrNames readDir elem concatStringsSep;

    availableThemes = attrNames (readDir ./themes);
    themeExists = elem "${theme}.nix" availableThemes;
    themeError = "Theme '${theme}' not found. Available: ${concatStringsSep ", " availableThemes}";
in
    assert themeExists || throw themeError; rec {
        base16Scheme = import ./themes/${theme}.nix;
        base16SchemeNoHashtag = let
            inherit (lib) mapAttrs;
            inherit (lib.strings) removePrefix;
        in
            mapAttrs (name: value: removePrefix "#" value) base16Scheme;
        user = "kevin";
        homeDirectory = ''/home/${user}'';
    }

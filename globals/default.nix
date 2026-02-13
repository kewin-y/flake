{theme}: let
    availableThemes = builtins.attrNames (builtins.readDir ./themes);
    themeExists = builtins.elem "${theme}.nix" availableThemes;
in
    assert themeExists || throw "Theme '${theme}' not found. Available: ${builtins.concatStringsSep ", " availableThemes}"; rec {
        base16Scheme = import ./themes/${theme}.nix;
        user = "kevin";
        homeDirectory = ''/home/${user}'';
    }

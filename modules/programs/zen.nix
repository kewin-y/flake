# https://wiki.nixos.org/wiki/Zen_Browser
{
    inputs,
    pkgs,
    lib,
    ...
}: let
    extension = shortId: guid: {
        name = guid;
        value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
        };
    };

    prefs = {
        "zen.view.experimental-no-window-controls" = true;
        "zen.welcome-screen.seen" = true;
    };

    # To add additional extensions, find it on addons.mozilla.org, find
    # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
    # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
    extensions = [
        (extension "ublock-origin" "uBlock0@raymondhill.net")
        (extension "youtube-recommended-videos" "myallychou@gmail.com")
    ];
in {
    environment.systemPackages = [
        (
            pkgs.wrapFirefox
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
            {
                extraPrefs = lib.concatLines (
                    lib.mapAttrsToList (
                        name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
                    )
                    prefs
                );

                extraPolicies = {
                    DisableTelemetry = true;
                    ExtensionSettings = builtins.listToAttrs extensions;

                    SearchEngines = {
                        Default = "ddg";
                    };
                };
            }
        )
    ];
}

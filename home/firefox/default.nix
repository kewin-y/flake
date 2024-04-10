{
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.kevin = {
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
        };
      };

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      search.force = true;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        istilldontcareaboutcookies
        return-youtube-dislikes
        tabliss
        leechblock-ng
      ];

      userChrome = lib.readFile "${inputs.penguin-fox}/files/chrome/userChrome.css";
      userContent = lib.readFile "${inputs.penguin-fox}/files/chrome/userContent.css";
    };
  };
}

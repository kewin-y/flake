{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.kevin = {
      isDefault = true;
      search = {
        default = "ddg";
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

      userChrome = ''
        * {
          border-radius: 0 !important;
        }

        .titlebar-close {
            display:none !important;
        }

        .titlebar-spacer[type="pre-tabs"] {
          display: none !important;
        }

        #alltabs-button { display: none !important; }
      '';

      search.force = true;

      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        istilldontcareaboutcookies
        return-youtube-dislikes
        tabliss
        leechblock-ng
        vimium
      ];
    };
  };
}

{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];

    # Tell me why card was base04 😂
    # See https://github.com/danth/stylix/blob/74ee1ed5057e44edbcc36aa189a91d31eda60485/modules/spicetify/spicetify.nix
    theme = {
      name = "stylix";
      src = pkgs.writeTextFile {
        name = "color.ini";
        destination = "/color.ini";
        text = with config.lib.stylix.colors; ''
          [base]
          text               = ${base05}
          subtext            = ${base05}
          main               = ${base00}
          main-elevated      = ${base02}
          highlight          = ${base02}
          highlight-elevated = ${base03}
          sidebar            = ${base01}
          player             = ${base05}
          card               = ${base02}
          shadow             = ${base00}
          selected-row       = ${base05}
          button             = ${base05}
          button-active      = ${base05}
          button-disabled    = ${base04}
          tab-active         = ${base02}
          notification       = ${base02}
          notification-error = ${base08}
          equalizer          = ${base0B}
          misc               = ${base02}
        '';
      };
      # Sidebar configuration is incompatible with the default navigation bar
      sidebarConfig = false;
    };
    colorScheme = "base";
  };
}

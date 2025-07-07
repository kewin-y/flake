# Looks ugly with light theme
{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
    ];

    theme = spicePkgs.themes.comfy;

    colorScheme = "custom";

    customColorScheme = with config.lib.stylix.colors; {
      text = base05;
      subtext = base05;
      main = base00;
      main-elevated = base02;
      sidebar = base01;
      highlight = base01;
      highlight-elevated = base02;
      player = base01;
      card = base02;
      shadow = base00;
      selected-row = base05;
      button = base05;
      button-active = base05;
      button-disabled = base04;
      tab-active = base02;
      notification = base02;
      notification-error = base08;
      equalizer = base0B;
      misc = base02;
    };
  };
}

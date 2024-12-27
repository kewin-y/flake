{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    dart-sass
    procps
    inputs.ags.packages.${pkgs.system}.io
  ];

  programs.ags = {
    enable = true;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      pkgs.gtk-session-lock
      auth
      battery
      bluetooth
      hyprland
      mpris
      network
      tray
      wireplumber
      notifd
      apps
    ];
  };

  home.file.".config/ags/scss/colors.scss".text = with config.lib.stylix.colors; ''
    $base00: #${base00};
    $base01: #${base01};
    $base02: #${base02};
    $base03: #${base03};
    $base04: #${base04};
    $base05: #${base05};
    $base06: #${base06};
    $base07: #${base07};
    $base08: #${base08};
    $base09: #${base09};
    $base0A: #${base0A};
    $base0B: #${base0B};
    $base0C: #${base0C};
    $base0D: #${base0D};
    $base0E: #${base0E};
    $base0F: #${base0F};
  '';
}

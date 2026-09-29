{
  pkgs,
  base16Scheme,
}: let
  inherit (pkgs.lib.generators) toINI;
  settings = {
    main = {
      font = "monospace:size=12";
      horizontal-pad = 18;
      vertical-pad = 18;
      inner-pad = 18;
      dpi-aware = "no";
      icons-enabled = "no";
      line-height = 20;
      lines = 8;
    };
    border = {
      radius = 5;
      width = 1;
    };
    colors = with base16Scheme; {
      background = "${base00}ff";
      text = "${base05}ff";
      selection-text = "${base05}ff";
      match = "${base05}ff";
      prompt = "${base05}ff";
      input = "${base05}ff";
      placeholder = "${base03}ff";
      selection-match = "${base05}ff";
      selection = "${base01}ff";
      border = "${base03}ff";
    };
  };
in
  pkgs.writeText "fuzzel.ini" (toINI {} settings)

{
  pkgs,
  config,
  ...
}: let
  lockscript = pkgs.writeShellScriptBin "lockscript" ''
    ${pkgs.waylock}/bin/waylock -init-color 0x${config.lib.stylix.colors.base00} -input-color 0x${config.lib.stylix.colors.base0C} -fail-color 0x${config.lib.stylix.colors.base08}
  '';
in {
  home.packages = with pkgs; [
    waylock
    lockscript
  ];
}

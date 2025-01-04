{
  pkgs,
  config,
  ...
}:
pkgs.writeShellScriptBin "lock" ''
  ${pkgs.waylock}/bin/waylock -init-color 0x${config.lib.stylix.colors.base00} -input-color 0x${config.lib.stylix.colors.base0D} -fail-color 0x${config.lib.stylix.colors.base08}
''

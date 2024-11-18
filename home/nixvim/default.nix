{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  nixvim = inputs.nixvim-config.packages.${pkgs.system}.default;
  nvim = nixvim.extend {
    config.theme = lib.mkForce "${config.theme}";
  };
in {
  home.packages = [
    nvim
  ];
}

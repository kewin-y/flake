{ config, pkgs, ... }: 

{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    scope = {
      showStart = false;
      showEnd = false;
    };
  };
}

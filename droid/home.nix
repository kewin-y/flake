{ config, lib, pkgs, ... }:

{

    imports = [
        ../home/git
    ];

    programs.ssh.enable = true;

  # Read the changelog before changing this value
  home.stateVersion = "24.05";

}

{base, ...}: let
  syncthingDirectory = "/home/${base.user}/Documents/sync";
in {
  services = {
    syncthing = {
      enable = true;
      user = "kevin";
      dataDir = syncthingDirectory; # Default folder for new synced folders
      configDir = "${syncthingDirectory}/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}

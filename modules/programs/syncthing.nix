{globals, ...}: {
  services = {
    syncthing = {
      enable = true;
      group = "users";
      user = "kevin";
      dataDir = "${globals.homeDirectory}/Documents/ksync";    # Default folder for new synced folders
      configDir = "${globals.homeDirectory}/Documents/ksync/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
  };
}

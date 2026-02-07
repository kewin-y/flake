{...}: {
  services = {
    syncthing = {
      enable = true;
      group = "users";
      user = "kevin";
      dataDir = "/home/kevin/Documents/ksync";    # Default folder for new synced folders
      configDir = "/home/kevin/Documents/ksync/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
  };
}

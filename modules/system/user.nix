{base, ...}: {
  users.users.${base.user} = {
    isNormalUser = true;
    description = "Kevin";
    extraGroups = ["networkmanager" "wheel" "video" "docker" "syncthing"];
  };
}

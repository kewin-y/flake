{pkgs, ...}: {
  environment.systemPackages = [pkgs.nautilus];
  # Needed for Nautilus Trash
  services.gvfs.enable = true;
}

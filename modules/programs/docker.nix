{pkgs, ...}: {
  virtualisation.docker.enable = true;
  environment.systemPackages = [pkgs.docker-compose];
}

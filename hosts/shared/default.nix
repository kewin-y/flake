{pkgs, ...}: {
  imports = [./stylix];

  theme.stylix = {
    polarity = "dark";
    themeName = "cyberdream";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager = {
    enable = true;
    appendNameservers = ["1.1.1.1"];
  };

  # Sorry for being Canadian
  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.graphics.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  services = {
    upower.enable = true;
  };

  security.pam.services.waylock = {};
  environment.shells = [pkgs.mksh];
  users.defaultUserShell = pkgs.mksh;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}

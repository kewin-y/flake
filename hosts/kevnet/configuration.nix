# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "kevnet"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    appendNameservers = ["1.1.1.1"];
  };

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.opengl.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevin = {
    isNormalUser = true;
    description = "Kevin";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    pamixer
    procps
    libnotify
  ];

  services.upower.enable = true;

  security.pam.services.hyprlock = {};

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.shells = [pkgs.mksh];
  users.defaultUserShell = pkgs.mksh;

  hardware.brillo.enable = true;

  hardware.ckb-next.enable = true;

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}

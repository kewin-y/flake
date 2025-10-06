{pkgs, ...}: {
  imports = [
    ./audio
    ./fonts
    ./graphics
    ./locale
    ./network
    ./security
    ./ssh
    ./upower
    ./users
    ./wayland
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };
}

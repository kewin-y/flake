{pkgs, globals, ...}: {
    imports = [
        ./audio.nix
        ./fonts.nix
        ./wayland.nix
    ];

    hardware.graphics.enable = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    time.timeZone = "America/Toronto";

    i18n.defaultLocale = "en_CA.UTF-8";

    services.xserver = {
        xkb = {
            layout = "us";
            variant = "";
        };
    };

    # TODO: Move this into a different module ...
    security.pam.services.waylock = {};
    security.pam.services.swaylock = {};

    networking.networkmanager.enable = true;

    users.users.${globals.user} = {
        isNormalUser = true;
        description = "Kevin";
        extraGroups = ["networkmanager" "wheel" "video" "docker" "ksync"];
    };

    nix.settings = {
        experimental-features = ["nix-command" "flakes"];
    };
}

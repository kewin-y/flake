{
    pkgs,
    globals,
    ...
}: {
    imports = [
        ./nix.nix
        ./network.nix
        ./bootloader.nix
        ./laptop.nix
        ./wayland.nix
        ./fonts.nix
        ./audio.nix
    ];

    hardware.graphics.enable = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    time.timeZone = "America/Toronto";

    i18n.defaultLocale = "en_CA.UTF-8";

    users.users.${globals.user} = {
        isNormalUser = true;
        description = "Kevin";
        extraGroups = ["networkmanager" "wheel" "video" "docker" "ksync"];
    };

}

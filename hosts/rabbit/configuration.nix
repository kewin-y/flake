{sysVer, ...}: {
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "rabbit";

    kevin = {
        laptop.enable = true;
        networkBlocking.enable = true;
        bootloader = "systemd-boot";
    };

    system.stateVersion = sysVer;
}

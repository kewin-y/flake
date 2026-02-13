{sysVer, ...}: {
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "kevnet";
    kevin = {
        laptop.enable = false;
        networkBlocking.enable = true;
        bootloader = "grub";
    };
    systemd.tpm2.enable = false;
    system.stateVersion = sysVer;
}

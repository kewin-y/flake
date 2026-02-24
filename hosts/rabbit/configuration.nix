{...}: {
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "rabbit";

    kevin = {
        laptop.enable = true;
        networkBlocking.enable = false;
        bootloader = "systemd-boot";
    };

    system.stateVersion = "25.05";
}

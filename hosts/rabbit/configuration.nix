{...}: {
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "rabbit";

    kevin = {
        laptop.enable = true;
        network.blocking = {
            enable = true;
        };
        bootloader = "systemd-boot";
    };

    system.stateVersion = "25.05";
}

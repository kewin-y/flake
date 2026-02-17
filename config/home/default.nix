{globals, ...}: {
    imports = [
        ./mksh.nix
        ./labwc
    ];

    hjem.users.${globals.user} = {
        user = globals.homeDirectory;
    };
}

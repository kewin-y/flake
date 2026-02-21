{globals, ...}: {
    imports = [
        ./mksh.nix
    ];

    hjem.users.${globals.user} = {
        user = globals.homeDirectory;
    };
}

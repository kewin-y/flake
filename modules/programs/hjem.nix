{globals, ...}: {
    hjem.users.${globals.user} = {
        user = globals.homeDirectory;
    };
}

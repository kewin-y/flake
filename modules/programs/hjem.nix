{globals, ...}: {
  # TODO: globals variable is stupid for this, use a module
  hjem.users.${globals.user} = {
    user = globals.homeDirectory;
  };
}

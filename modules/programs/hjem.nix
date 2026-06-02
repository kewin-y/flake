{base, ...}: {
  hjem.users.${base.user} = {
    directory = "/home/${base.user}";
  };
}

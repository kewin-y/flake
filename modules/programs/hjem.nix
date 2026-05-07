{base, ...}: {
  hjem.users.${base.user} = {
    user = "/home/${base.user}";
  };
}

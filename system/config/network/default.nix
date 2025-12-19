{
  networking = {
    networkmanager = {
      enable = true;
      appendNameservers = ["1.1.1.1"];
    };
    stevenblack = {
      enable = true;
      block = [
        "fakenews"
        "gambling"
        "porn"
      ];
    };
  };
}

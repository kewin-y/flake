{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  networking = {
    networkmanager = {
      enable = true;
    };

    stevenblack = {
      enable = true;
      block = [
        "fakenews"
        "social"
      ];
    };

    extraHosts = ''
      0.0.0.0 wallhaven.cc
      0.0.0.0 coomer.st
      0.0.0.0 cosplaytele.com
      0.0.0.0 open.spotify.com
      0.0.0.0 spotify.com
      0.0.0.0 soundcloud.com
      0.0.0.0 nitter.net
      0.0.0.0 nitter.net
      0.0.0.0 mangakatana.com
      0.0.0.0 mangadex.org
      0.0.0.0 mangabuddy.com
    '';
  };
}

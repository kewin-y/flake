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
      # 0.0.0.0 open.spotify.com
      # 0.0.0.0 spotify.com
      0.0.0.0 soundcloud.com
      0.0.0.0 youtube.com
      0.0.0.0 www.youtube.com
    '';
  };
}

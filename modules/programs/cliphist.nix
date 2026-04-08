{pkgs, ...}: let
in {
  environment.systemPackages = [
    pkgs.cliphist
    pkgs.wl-clipboard
    pkgs.chafa
  ];

  systemd.user.services.cliphist = {
    description = "cliphist";
    after = ["niri.service"];
    wantedBy = ["niri.service"];

    serviceConfig = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
  };
}

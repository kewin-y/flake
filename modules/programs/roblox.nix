{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.rokit.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.vinegar
  ];
}

{
  inputs,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}

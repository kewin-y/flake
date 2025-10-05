{
  inputs,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.nvim-config.packages.${pkgs.system}.default
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}

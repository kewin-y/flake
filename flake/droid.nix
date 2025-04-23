{inputs, ...}: {
  flake.nixOnDroidConfigurations.default = let
    inherit (inputs) nix-on-droid nixpkgs-other hm-other;
  in
    nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [../droid];
      extraSpecialArgs = {inherit inputs;};
      pkgs = import nixpkgs-other {
        system = "aarch64-linux";
        overlays = [
          nix-on-droid.overlays.default
        ];
      };
      home-manager-path = hm-other.outPath;
    };
}

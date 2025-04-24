{inputs, ...}: {
  flake.nixosConfigurations = let
    inherit (inputs) nixpkgs home-manager stylix;
    inherit (nixpkgs) lib;

    mkSystem = hname:
      lib.nixosSystem {
        modules = [
          ../hosts/${hname}/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.users.kevin = ../home/desktop;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
        specialArgs = {inherit inputs;};
      };
  in {
    keven = mkSystem "keven";
    kevnet = mkSystem "kevnet";
  };
}

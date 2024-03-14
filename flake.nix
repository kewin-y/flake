{
	description = "here be dragons";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";

		# Makes sure that home manager & nixkpgs versions are the same
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		hyprland.url = "github:hyprwm/Hyprland";

		ags.url = "github:Aylur/ags";

		stylix.url = "github:bluskript/stylix";

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, stylix, nixvim, ... }@inputs: 
		let
			system = "x86_64-linux";
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			nixosConfigurations = {
				keven = lib.nixosSystem {
					system =  system;
					modules = [ ./hosts/keven/configuration.nix ];
					specialArgs = { inherit inputs; };
				};
				kevnet = lib.nixosSystem {
					system = system;
					modules = [ ./hosts/kevnet/configuration.nix ];
					specialArgs = { inherit inputs; };
				};
			};
			homeConfigurations = {
				kevin = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					extraSpecialArgs = { inherit inputs; };
					modules = [ stylix.homeManagerModules.stylix nixvim.homeManagerModules.nixvim ./home.nix ];
				};
			};
		};
}

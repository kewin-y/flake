{ pkgs, config, inputs, ...}:

{
	imports = [ inputs.ags.homeManagerModules.default ];

	home.packages = with pkgs; [
		sassc
		pavucontrol
		networkmanagerapplet
		waylock
	];

	programs.ags = {
		enable = true;
		configDir = ../../ags;
	};
		
}

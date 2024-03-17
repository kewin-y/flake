{ pkgs, ... }:

{
	home.packages = with pkgs; [ 
		mksh
		eza
		fd
		fzf
	];

	home.file.".mkshrc".source = ./.mkshrc;
}

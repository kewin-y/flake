{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		tofi
	];

	home.file."./.config/tofi/config".text = '' 
		font = "/run/current-system/sw/share/X11/fonts/IosevkaNerdFont-Regular.ttf"	
		font-size = 10
		hint-font = true
		width = 20%
		height = 20%
		result-spacing = 15
		horizontal = false
		outline-width = 0
		border-width = 4
		corner-radius = 6
		clip-to-padding = true
		scale = true
		anchor = center
		exclusive-zone = -1
		hide-cursor = false
		text-cursor = true
		history = true
		require-match = true
		auto-accept-single = false
		hide-input = false
		hidden-character = "*"
		drun-launch = true 
		terminal = foot
		late-keyboard-init = false
		multi-instance = true 
		ascii-input = true
		text-color = #c2c4c2
		selection-color = #5a7d82
		background-color = #111517
		border-color = #111115
	'';

	home.activation = {
		# https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
		regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
			tofi_cache=${config.xdg.cacheHome}/tofi-drun
			[[ -f "$tofi_cache" ]] && rm "$tofi_cache"
		'';
	};
}


{ pkgs, ... }:

{
	home.packages = with pkgs; [
		polkit_gnome
		swww
	];
	wayland.windowManager.hyprland = {
		settings = {
			exec-once = [
				"${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
				"ags"
				"${pkgs.swww}/bin/swww init && ${pkgs.swww}/bin/swww img ~/nixdots/wallpapers/accordion.jpg"
			];
			input = {
			    kb_layout = "us";
			    follow_mouse = "1";
			    sensitivity = "0";
			    force_no_accel = "1";

			    touchpad = {
				natural_scroll = false;
			    };

			};

			gestures = {
			    workspace_swipe = true;
			    workspace_swipe_fingers = "3";
			};

			dwindle = {
			    pseudotile = true; 
			    preserve_split = true;
			};

			master = {
			    new_is_master = true;
			};

			misc = {
			    vrr = "0";
			    enable_swallow = true;
			    swallow_regex = "^(foot)$";
			};
		};

		# Help Me
		extraConfig = '' 
			env=QT_AUTO_SCREEN_SCALE_FACTOR,1
			env=QT_QPA_PLATFORM,wayland;xcb
			env=QT_WAYLAND_DISABLE_WINDOWDECORATION,1
		'';
	};
}

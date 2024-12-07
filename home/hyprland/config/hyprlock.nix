{config, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = with config.lib.stylix.colors; {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          blur_passes = 0;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
          path = "${config.wallpaper}";
        }
      ];

      input-field = [
        {
          size = "180, 50";
          rounding = -1;
          position = "0, 0";
          monitor = "";
          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.25;
          fade_on_empty = false;
          font_color = "rgb(${base05})";
          inner_color = "rgb(${base00})";
          outer_color = "rgb(${base01})";
          check_color = "rgb(${base09})";
          fail_color = "rgb(${base08})";
          font_family = "Rubik";
          outline_thickness = 2;
          placeholder_text = ''<b>Password...</b>'';
          fail_text = ''<b>Failed to Authenticate</b>'';
        }
      ];
    };
  };
}

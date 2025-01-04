{config, ...}: {
  services.mako = with config.lib.stylix.colors.withHashtag; {
    enable = true;
    sort = "-time";
    layer = "overlay";
    backgroundColor = base00;
    textColor = base05;
    width = 200;
    height = 300;
    padding = "12";
    borderSize = 2;
    borderRadius = 0;
    borderColor = base0D;
    markup = true;
    icons = true;
    format = ''%s\n\n<span font='8'>%b</span>'';
    actions = true;
    maxIconSize = 32;
    defaultTimeout = 0;
    ignoreTimeout = true;
    font = "tamzen 10";
    extraConfig = ''
      [urgency=low]
      border-color=${base0B}

      [urgency=normal]
      border-color=${base01}

      [urgency=high]
      border-color=${base08}

      [actionable]
      format=%s\n\n<span font='8'>%b</span>\n\n<span font='7'>M-O to view actions</span>
    '';
  };
}

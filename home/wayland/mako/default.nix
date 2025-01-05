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
    format = ''%s\n\n%b'';
    actions = true;
    maxIconSize = 32;
    defaultTimeout = 0;
    ignoreTimeout = true;
    font = "MapleMono NF 9";
    extraConfig = ''
      [urgency=low]
      border-color=${base0B}

      [urgency=normal]
      border-color=${base01}

      [urgency=high]
      border-color=${base08}

      [actionable]
      format=%s\n\n%b\n\nM-O to view actions
    '';
  };
}

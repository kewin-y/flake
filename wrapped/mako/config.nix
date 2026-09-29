{
  pkgs,
  base16Scheme,
}:
with base16Scheme;
  pkgs.writeText "config" ''
    sort=-time
    layer=overlay
    background-color=${base00}
    text-color=${base05}
    border-color=${base04}
    width=300
    height=300
    padding=12
    border-size=1
    border-radius=5
    markup=true
    icons=true
    format=<b>%s</b>\n\n%b
    actions=true
    max-icon-size=32
    default-timeout=0
    ignore-timeout=true
    font=monospace 11

    [urgency=low]
    border-color=${base0B}

    [urgency=normal]
    border-color=${base03}

    [urgency=high]
    border-color=${base08}

    [actionable=true]
    format=<b>%s</b>\n\n%b\n\nM-A to view actions
  ''

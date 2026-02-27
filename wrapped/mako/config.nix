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
        border-color=${base0D}
        width=350
        height=300
        padding=12
        border-size=2
        border-radius=16
        markup=true
        icons=true
        format=%s\n\n%b
        actions=true
        max-icon-size=32
        default-timeout=0
        ignore-timeout=true
        font=monospace 11

        [urgency=low]
        border-color=${base0B}

        [urgency=normal]
        border-color=${base0D}

        [urgency=high]
        border-color=${base08}

        [actionable=true]
        format=%s\n\n%b\n\nM-O to view actions
    ''

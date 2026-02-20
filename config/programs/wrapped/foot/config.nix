{
    pkgs,
    base16Scheme,
}:
with base16Scheme;
    pkgs.writeText "foot.ini" ''
        [colors]
        alpha=1.000000
        cursor=100f0f cecdc3

        [main]
        box-drawings-uses-font-glyphs=no
        dpi-aware=no
        font=monospace:size=12
        # include=/nix/store/nany2jmfcmbyznbvpvkaqja2p6z3h8ci-base16-untitled.ini
        pad=24x24

        [tweak]
        grapheme-width-method=double-width

        [colors]
        foreground=cecdc3
        background=100f0f
        regular0=100f0f # black
        regular1=d14d41 # red
        regular2=879a39 # green
        regular3=d0a215 # yellow
        regular4=4385be # blue
        regular5=8b7ec8 # magenta
        regular6=3aa99f # cyan
        regular7=cecdc3 # white
        bright0=575653 # bright black
        bright1=d14d41 # bright red
        bright2=879a39 # bright green
        bright3=d0a215 # bright yellow
        bright4=4385be # bright blue
        bright5=8b7ec8 # bright magenta
        bright6=3aa99f # bright cyan
        bright7=fffcf0 # bright white
        16=da702c
        17=ce5d97
        18=1c1b1a
        19=282726
        20=878580
    ''

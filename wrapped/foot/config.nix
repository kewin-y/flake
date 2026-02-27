# https://github.com/tinted-theming/tinted-terminal/blob/main/templates/foot-base16.mustache
{
    pkgs,
    base16SchemeNoHashtag,
}:
with base16SchemeNoHashtag;
    pkgs.writeText "foot.ini" ''
        [colors]
        alpha=1.000000
        cursor=100f0f cecdc3

        [main]
        box-drawings-uses-font-glyphs=no
        dpi-aware=no
        font=monospace:size=12
        pad=24x24

        [tweak]
        grapheme-width-method=double-width

        [colors]
        foreground=${base05}
        background=${base00}
        regular0=${base00} # black
        regular1=${base08} # red
        regular2=${base0B} # green
        regular3=${base0A} # yellow
        regular4=${base0D} # blue
        regular5=${base0E} # magenta
        regular6=${base0C} # cyan
        regular7=${base05} # white
        bright0=${base03} # bright black
        bright1=${base08} # bright red
        bright2=${base0B} # bright green
        bright3=${base0A} # bright yellow
        bright4=${base0D} # bright blue
        bright5=${base0E} # bright magenta
        bright6=${base0C} # bright cyan
        bright7=${base07} # bright white
        16=${base09}
        17=${base0F}
        18=${base01}
        19=${base02}
        20=${base04}
        21=${base06}
    ''

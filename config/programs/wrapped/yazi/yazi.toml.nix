pkgs:
pkgs.writeTextDir "yazi/yazi.toml" ''
    [[open.rules]]
    mime = "image/*"
    use = "image"

    [[open.rules]]
    mime = "video/*"
    use = "video"

    [[open.rules]]
    mime = "audio/*"
    use = "audio"

    [[open.rules]]
    mime = "application/pdf"
    use = "pdf"

    [[opener.audio]]
    desc = "Listen to Audio"
    run = "mpv \"$1\""

    [[opener.image]]
    desc = "View Image"
    run = "imv \"$1\""

    [[opener.pdf]]
    desc = "View PDF"
    run = "zathura \"$1\""

    [[opener.video]]
    desc = "Watch Video"
    run = "mpv \"$1\""
''

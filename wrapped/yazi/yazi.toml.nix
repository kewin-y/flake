# Don't use formats.toml:
# See: https://github.com/NixOS/nixpkgs/issues/387673
pkgs:
pkgs.writeTextDir "yazi/yazi.toml" ''
    [[open.prepend_rules]]
    mime = "image/*"
    use = "image"

    [[open.prepend_rules]]
    mime = "video/*"
    use = "video"

    [[open.prepend_rules]]
    mime = "audio/*"
    use = "audio"

    [[open.prepend_rules]]
    mime = "application/pdf"
    use = "pdf"

    [[opener.audio]]
    desc = "Listen to Audio"
    run = "mpv %s"
    orphan = true

    [[opener.image]]
    desc = "View Image"
    run = "imv %s"
    orphan = true

    [[opener.pdf]]
    desc = "View PDF"
    run = "sioyek %s"
    orphan = true

    [[opener.video]]
    desc = "Watch Video"
    run = "mpv %s"
    orphan = true
''

{
  config,
  lib,
  ...
}: {
  home.file.".config/labwc/themerc-override".text = with config.lib.stylix.colors.withHashtag; ''
    border.width: 2

    # Window
    window.titlebar.padding.width: 7
    window.titlebar.padding.height: 7
    window.label.text.justify: Left
    window.*.button.*.image.color: ${base05}
    window.*.label.text.color: ${base05}
    window.*.title.bg.color: ${base01}
    window.active.border.color: ${base01}
    window.inactive.border.color: ${base01}
    window.button.width: 22
    window.button.height: 22

    # OSD
    osd.bg.color: ${base00}
    osd.border.color: ${base01}
    osd.label.text.color: ${base05}
    osd.border.width: 2
    osd.window-switcher.padding: 7
    osd.window-switcher.item.padding.x: 7
    osd.window-switcher.item.padding.y: 7
    osd.window-switcher.item.active.border.width: 2
    osd.window-switcher.preview.border.width: 0
    osd.window-switcher.width: 300

    # menu
    menu.overlap.x: 0
    menu.width.min: 20
    menu.width.max: 200
    menu.border.width: 8
    menu.border.color: ${base01}
    menu.items.bg.color: ${base01}
    menu.items.text.color: ${base05}
    menu.items.active.bg.color: ${base02}
    menu.items.active.text.color: ${base05}
    menu.items.padding.x: 10
    menu.items.padding.y: 10
    menu.separator.width: 1
    menu.separator.padding.width: 0
    menu.separator.padding.height: 4
    #base03
    menu.separator.color: ${base03}
    menu.title.bg.color: ${base01}
    menu.title.text.color: ${base05}
    menu.title.text.justify: Left
  '';
}

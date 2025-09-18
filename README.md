# kewin-y's NixOS Config

Pretty standard NixOS/Home Manager configurations. I've tried to keep them as simple as possible.

I think a rewrite is due in a lot of areas. For one, I would like to get rid of home-manager and stylix as I feel like they're too overkill.

## Structure

```
.
├── home
│   └── config
│       ├── firefox
│       ├── foot
│       ├── git
│       ├── gui
│       ├── mksh
│       ├── stylix
│       ├── tmux
│       ├── wayland
│       │   ├── fuzzel
│       │   ├── labwc
│       │   │   ├── config
│       │   │   └── scripts
│       │   ├── mako
│       │   └── waybar
│       ├── xdg
│       └── yazi
├── hosts
│   ├── keven
│   ├── kevnet
│   └── shared
│       └── stylix
│           └── themes
├── modules
└── wallpapers
```

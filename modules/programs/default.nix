{
    pkgs,
    lib,
    wrapped,
    ...
}: {
    imports = [
        ./gui.nix
        ./niri.nix
        ./mksh.nix
        ./hjem.nix
        ./obsidian.nix
        ./docker.nix
        ./git.nix
        ./neovim.nix
        ./ssh.nix
        ./syncthing.nix
    ];

    environment.systemPackages =
        lib.attrValues {
            inherit
                (pkgs)
                wget
                curl
                git
                pamixer
                libnotify
                wl-clipboard
                ripgrep
                fastfetch
                unzip
                killall
                nautilus
                swayimg
                mpv
                htop
                pavucontrol
                obs-studio
                rnote
                typst
                chromium
                zk
                zoom-us
                vesktop
                nodejs
                pnpm
                prettierd
                typescript-language-server
                tailwindcss-language-server
                zathura
                imv
                ;
        }
        ++ lib.attrValues wrapped;
}

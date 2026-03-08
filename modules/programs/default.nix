{
    pkgs,
    lib,
    wrapped,
    inputs,
    ...
}: {
    imports = [
        ./gui.nix
        ./niri.nix
        ./hjem.nix
        ./obsidian.nix
        ./docker.nix
        ./git.nix
        ./ssh.nix
        ./syncthing.nix
        ./xdg.nix
        ./zsh.nix
        ./zen.nix
    ];

    programs.nix-ld.enable = true;

    environment.sessionVariables = {
      EDITOR = "nvim";
    };

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
                bun
                libreoffice
                opencode
                ;
        }
        ++ lib.attrValues wrapped;
}

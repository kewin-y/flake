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

    nix.settings = {
        substituters = ["https://codex-cli.cachix.org"];
        trusted-public-keys = ["codex-cli.cachix.org-1:YOUR_PUBLIC_KEY_HERE"];
    };

    # Needed for Nautilus Trash
    services.gvfs.enable = true;
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
        ++ lib.attrValues wrapped ++ [inputs.codex-cli-nix.packages.${pkgs.system}.default];
}

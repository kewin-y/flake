{
    pkgs,
    lib,
    ...
}: {
    imports = [
        ./docker.nix
        ./git.nix
        ./syncthing.nix
        ./neovim.nix
        ./stylix
        ./wrapped
    ];

    theme.stylix = {
        polarity = "dark";
        themeName = "flexoki";
    };

    environment.shells = [pkgs.mksh];
    users.defaultUserShell = pkgs.mksh;

    home-manager.useGlobalPkgs = true;

    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };

    environment.systemPackages = lib.attrValues {
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
            ;
    };
}

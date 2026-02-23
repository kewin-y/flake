{
    pkgs,
    globals,
    ...
}: {
    environment.systemPackages = [
        pkgs.mksh
        pkgs.fd
        pkgs.fzf
    ];

    hjem.users.${globals.user}.files = {
        ".mkshrc".text = let
            fzfOpts = with globals.base16Scheme; ''
                export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
                  --color=fg:${base04},bg:${base00},hl:${base0D}
                  --color=fg+:${base06},bg+:${base01},hl+:${base0D}
                  --color=info:${base0D},prompt:${base0D},pointer:${base0C}
                  --color=marker:${base0C},spinner:${base0C},header:${base0D}
                '
            '';
        in ''
            # vim: ft=sh
            alias  l='ls -lh --color=auto'
            alias ls='ls -1 --color=auto'
            alias ll='ls -lha --sort=name --group-directories-first --color=auto'
            alias ld='ls -d */ --color=auto'
            alias yz='yazi'
            alias dev='nix develop -c tmux'

            alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt'

            HISTFILE=$HOME/.mksh_history
            HISTSIZE=5000
            HISTCONTROL=ignoreboth

            ${fzfOpts}

            function cd {
              command cd "$@"
              PS1=$(
                if [[ "''${PWD#$HOME}" != "$PWD" ]]; then
                  print -n "\e[1;34m~''${PWD#$HOME}"
                else
                  print -n "\e[1;34m$PWD"
                fi
                print -n " \e[1;32m$ \e[0m"
              )
            }

            function cdd {
              local dir=$(fd -H -t d -a | fzf)

              if [ -n "$dir" ]; then
                cd "$dir"
              fi
            }

            set -o vi
            cd "$PWD"
        '';
    };
}

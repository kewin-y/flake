{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    mksh
    fd
  ];

  programs.fzf.enable = true;
  programs.eza = {
    enable = true;
    icons = null;
  };

  # RAHHH
  home.file.".mkshrc".text = with config.lib.stylix.colors; ''
    # vim: ft=sh
    alias  l='eza -lh'
    alias ls='eza -1'
    alias ll='eza -lha --sort=name --group-directories-first'
    alias ld='eza -lhD '
    alias yz='yazi'
    alias dev='nix develop -c tmux'

    HISTFILE=$HOME/.mksh_history
    HISTSIZE=5000
    HISTCONTROL=ignoreboth

    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#${base04},bg:#${base00},hl:#${base0D} --color=fg+:#${base06},bg+:#${base01},hl+:#${base0D} --color=info:#${base0D},prompt:#${base0D},pointer:#${base0C} --color=marker:#${base0C},spinner:#${base0C},header:#${base0D}'

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
}

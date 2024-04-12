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
  programs.eza.enable = true;

  home.file.".mkshrc".text = with config.lib.stylix.colors; ''
    # vim: ft=sh
    alias  l='eza -lh  --icons=auto'
    alias ls='eza -1   --icons=auto'
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
    alias ld='eza -lhD --icons=auto'
    alias yz='yazi'

    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#${base04},bg:#${base00},hl:#${base0D} --color=fg+:#${base06},bg+:#${base01},hl+:#${base0D} --color=info:#${base0D},prompt:#${base0D},pointer:#${base0C} --color=marker:#${base0C},spinner:#${base0C},header:#${base0D}'

    # This is from stackoverflow
    function _cd {
      \cd "$@"
      PS1=$(
        if [[ "''${PWD#$HOME}" != "$PWD" ]]; then
          print -n "\e[1;34m~''${PWD#$HOME}"
        else
          print -n "\e[1;34m$PWD"
        fi
        print -n " \e[1;32m$ \e[0m"
      )
    }

    alias cd=_cd

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

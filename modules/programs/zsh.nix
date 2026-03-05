{
  pkgs,
  globals,
  ...
}: {
  environment.systemPackages = [
    pkgs.fd
    pkgs.fzf
  ];

  # Set Zsh as the default shell system-wide
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 5000;
    setOptions = [
      "HIST_IGNORE_DUPS"
      "HIST_IGNORE_SPACE"
    ];

    promptInit = "PROMPT='%F{blue}%~ %F{green}$ %f'";

    shellAliases = {
      l = "ls -lh --color=auto";
      ls = "ls -1 --color=auto";
      ll = "ls -lha --sort=name --group-directories-first --color=auto";
      ld = "ls -d */ --color=auto";
      yz = "yazi";
      dev = "nix develop -c tmux";
      vg = "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt";
    };
    interactiveShellInit = let
      fzfOpts = with globals.base16Scheme; ''
        export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
          --color=fg:${base04},bg:${base00},hl:${base0D}
          --color=fg+:${base06},bg+:${base01},hl+:${base0D}
          --color=info:${base0D},prompt:${base0D},pointer:${base0C}
          --color=marker:${base0C},spinner:${base0C},header:${base0D}
        '
      '';
    in ''
      ${fzfOpts}

      function cdd() {
        local dir=$(fd -H -t d -a | fzf)

        if [[ -n "$dir" ]]; then
          cd "$dir"
        fi
      }

      # Enable vi mode
      bindkey -v
    '';
  };
}

{
  pkgs,
  globals,
  ...
}: {
  environment.systemPackages = [
    pkgs.fd
    pkgs.fzf
  ];

  environment.shells = [pkgs.zsh];
  users.defaultUserShell = pkgs.zsh;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 5000;
    setOptions = [
      "HIST_IGNORE_DUPS"
      "HIST_IGNORE_SPACE"
    ];

    promptInit = "PROMPT='%~ $ '";

    shellAliases = {
      l = "ls -lh --color=auto";
      ls = "ls -1 --color=auto";
      ll = "ls -lha --sort=name --group-directories-first --color=auto";
      ld = "ls -d */ --color=auto";
      yz = "yazi";
      vg = "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt";
      clh = "cliphist-fzf-sixel";
    };
    interactiveShellInit = with globals.base16Scheme; let
      accent = base0E;

      fzfOpts = ''
        export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
          --color=fg:${base04},bg:${base00},hl:${accent}
          --color=fg+:${base05},bg+:${base01},hl+:${accent}
          --color=info:${accent},prompt:${accent},pointer:${accent}
          --color=marker:${accent},spinner:${accent},header:${accent}
        '
      '';
    in ''
      ${fzfOpts}
      bindkey -v
      bindkey '^y' autosuggest-accept
    '';
  };
}

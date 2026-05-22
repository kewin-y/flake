{
  pkgs,
  base16Scheme,
}: let
  config = with base16Scheme;
    pkgs.writeText "" ''
      set -g prefix C-s
      unbind C-b
      bind C-s send-prefix

      set -g base-index 1
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -g default-terminal "tmux-256color"
      set-option -g default-shell "${pkgs.zsh}/bin/zsh"
      set-option -sa terminal-overrides ",foot*:Tc"
      setw -g mode-keys vi
      set -g extended-keys on
      set -g extended-keys-format csi-u
      set-option -g renumber-windows on
      set -s set-clipboard on

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key -r -T prefix C-k resize-pane -U
      bind-key -r -T prefix C-j resize-pane -D
      bind-key -r -T prefix C-h resize-pane -L
      bind-key -r -T prefix C-l resize-pane -R
      bind g display-popup -w 80% -h 80% -E "lazygit"

      set-option -g status-position bottom

      set-option -g status-style "fg=${base05},bg=${base01}"
    '';
in
  pkgs.symlinkJoin {
    name = "tmux-wrapped";
    paths = [pkgs.tmux];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/tmux --add-flags "-f ${config}"
    '';
  }

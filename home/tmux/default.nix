{config, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    baseIndex = 1;
    extraConfig = with config.lib.stylix.colors; ''
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set-option -sa terminal-overrides ",foot*:Tc"

      setw -g mode-keys vi

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key -r -T prefix C-k resize-pane -U
      bind-key -r -T prefix C-j resize-pane -D
      bind-key -r -T prefix C-h resize-pane -L
      bind-key -r -T prefix C-l resize-pane -R

      set-option -g status-position top

      set-option -g status-style "fg=#${base04},bg=#${base01}"
      set-window-option -g window-status-style "fg=#${base04},bg=default"
      set-window-option -g window-status-current-style "fg=#${base0D},bg=default"
      set-option -g pane-border-style "fg=#${base01}"
      set-option -g pane-active-border-style "fg=#${base02}"
      set-option -g message-style "fg=#${base06},bg=#${base01}"
      set-option -g display-panes-active-colour "#${base0B}"
      set-option -g display-panes-colour "#${base0D}"
      set-window-option -g clock-mode-colour "#${base0B}"
      set-window-option -g mode-style "fg=#${base04},bg=#${base02}"
      set-window-option -g window-status-bell-style "fg=#${base01},bg=#${base08}"
    '';
  };
}

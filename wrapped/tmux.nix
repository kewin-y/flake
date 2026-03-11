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
            set-option -g renumber-windows on

            bind-key h select-pane -L
            bind-key j select-pane -D
            bind-key k select-pane -U
            bind-key l select-pane -R
            bind-key -r -T prefix C-k resize-pane -U
            bind-key -r -T prefix C-j resize-pane -D
            bind-key -r -T prefix C-h resize-pane -L
            bind-key -r -T prefix C-l resize-pane -R

            set-option -g status-position top

            set-option -g status-style "fg=${base04},bg=${base01}"

            set-window-option -g window-status-style "fg=${base04},bg=default"
            set-window-option -g window-status-current-style "fg=${base05},bg=default"

            set-window-option -g window-status-format "#I:#W "
            set-window-option -g window-status-current-format "#I:#W "

            set-option -g status-left " "
            set-option -g status-right " %a %b %d %H:%M [#S] "

            set-option -g pane-border-style "fg=${base01}"
            set-option -g pane-active-border-style "fg=${base02}"
            set-option -g message-style "fg=${base06},bg=${base01}"
            set-option -g display-panes-active-colour "${base0B}"
            set-option -g display-panes-colour "${base0D}"
            set-window-option -g clock-mode-colour "${base0B}"
            set-window-option -g mode-style "fg=${base05},bg=${base02}"
            set-window-option -g window-status-bell-style "fg=${base01},bg=${base08}"
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

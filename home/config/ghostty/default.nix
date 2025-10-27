{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      window-padding-x = 24;
      window-padding-y = 24;
      gtk-single-instance = true;
      confirm-close-surface = false;
      quit-after-last-window-closed=false;
    };
  };
}

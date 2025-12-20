{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      window-padding-x = 24;
      window-padding-y = 24;
      gtk-single-instance = true;
      quit-after-last-window-closed = false;
    };
  };
}

{
    pkgs,
    base16Scheme,
}:
with base16Scheme;
    pkgs.writeText "style.css" ''
        *:not(separator) {
          all: unset;
          font-family: "monospace";
          font-size: 10pt;
        }

        /* Main Bar */
        window#waybar {
          background: ${base00};
          border-top: 2px solid ${base01};
          color: ${base05};
        }

        window#waybar.hidden {
          opacity: 0.2;
        }

        .modules-left {
          margin-left: 0.5rem;
        }

        .modules-right {
          margin-right: 0.5rem;
        }

        menu {
          background: ${base01};
          padding: 8px;
        }

        menu separator {
          background: ${base03};
          margin: 0.4rem 0;
        }

        menu menuitem {
          color: ${base05};
          padding: 0.8rem;
        }

        menu menuitem:hover {
          background: ${base02};
        }

        tooltip {
          background: ${base01};
          color: ${base05};
        }

        tooltip label {
          margin: 0.8rem;
        }

        #clock,
        #taskbar,
        #tray,
        #battery,
        #wireplumber,
        #network {
          margin: 0 0.5rem;
        }

        #taskbar button {
          margin: 0 0.8rem;
        }

        #taskbar:first-child {
          margin-left: 0;
        }

        #taskbar:last-child {
          margin-right: 0;
        }

        #taskbar button:hover,
        #taskbar button.active {
          font-weight: bold;
        }

    ''

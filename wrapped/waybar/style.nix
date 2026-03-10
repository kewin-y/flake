{
    pkgs,
    base16Scheme,
}:
with base16Scheme;
    pkgs.writeText "style.css" ''
        *:not(separator) {
          all: unset;
          font-family: monospace;
        }

        window#waybar {
          font-size: 11pt;
          background: ${base00};
          border-top: 0.18em solid ${base01};
          color: ${base05};
        }

        window#waybar.hidden {
          opacity: 0.2;
        }

        .modules-left {
          margin-left: 1.5em;
        }

        .modules-right {
          margin-right: 1.5em;
        }

        menu {
          background: ${base01};
          padding: 0.7em;
          border-radius: 0.4em;
        }

        menu separator {
          background: ${base03};
          margin: 0.35em 0;
        }

        menu menuitem {
          color: ${base05};
          padding: 0.6em 0.8em;
          border-radius: 0.3em;
        }

        menu menuitem:hover {
          background: ${base02};
        }

        tooltip {
          background: transparent;
          border-radius: 0.3em;
          box-shadow: none;
        }

        tooltip box {
          background: ${base01};
          border-radius: 0.3em;
          padding: 0.8em 1em;
        }

        tooltip label {
          background: transparent;
          color: ${base05};
        }

        #tray {
          background: ${base01};
          margin: 0.5em 0;
          padding: 0 0.5em;
          border-radius: 0.3em;
        }

        #workspaces button {
          margin: 0 0.25em;
          color: ${base04};
        }

        #workspaces button.active {
          color: ${base05};
        }

        #workspaces button.urgent {
          color: ${base08};
        }

        #workspaces button:hover {
          color: ${base06};
        }
    ''

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
        #workspaces,
        #window,
        #tray,
        #battery,
        #wireplumber,
        #network {
          margin: 0 0.5rem;
        }
        #workspaces button {
          margin: 0 0.2rem;
          color: ${base04};
        }
        #workspaces button.active {
          color: ${base05};
          font-weight: bold;
        }
        #workspaces button.urgent {
          color: ${base08};
        }
        #workspaces button:hover {
          color: ${base06};
        }
        #window {
          color: ${base05};
        }
    ''

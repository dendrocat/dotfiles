pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    id: root

    property string layout: "Eng";

    Connections {
        target: Hyprland;
        function onRawEvent(event: HyprlandEvent) {
            if (event.name !== "activelayout") return;

            const data = event.data;
            const full_layout = data.slice(data.indexOf(",") + 1);
			root.layout = full_layout.slice(0, 3)
        }
    }
}

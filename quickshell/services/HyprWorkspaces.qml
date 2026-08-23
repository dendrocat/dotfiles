pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.config

Singleton {
    id: root

    property list<HyprlandWorkspace> workspaces

    function updateWorkspaces() {
        const ws = Hyprland.workspaces.values;
        const persistent = Config.workspace.persistent;

		const normal = Array.from({ length: persistent }, () => undefined);
		const after = [];

        for (const w of ws) {
            if (w.id > persistent)
                after.push(w);
            else
                normal[w.id - 1] = w;
        }
        workspaces = [...normal, ...after];
    }

    function focusOnWorkspaceWithId(index: int) {
        Hyprland.dispatch("hl.dsp.focus({ workspace = " + index + " })");
    }

    Component.onCompleted: root.updateWorkspaces()

    Connections {
        target: Hyprland.workspaces
        function onValuesChanged() {
            root.updateWorkspaces();
        }
    }
}

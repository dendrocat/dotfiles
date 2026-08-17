pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property Colors _colors: Colors {}

    readonly property QtObject font: QtObject {
        readonly property string family: "DejaVu Sans"
		readonly property string monospace: "JetBrainsMono NF"
        readonly property int size: 11
    }

    readonly property QtObject bar: QtObject {
        readonly property int height: 35
        readonly property int rounding: 15

        readonly property int spacing: 15
    }

    readonly property QtObject colors: QtObject {
        readonly property color fg: root._colors.primary
        readonly property color bg: root._colors.surface_container_low
        readonly property color bg_alt: root._colors.surface_container_high
        readonly property color brc: root._colors.surface_bright

        readonly property color error: root._colors.error
    }

    readonly property QtObject workspace: QtObject {
        readonly property color color: root._colors.inverse_primary

        readonly property color hover_color: root._colors.secondary
        readonly property color hover_bg: root._colors.secondary_container
    }

    readonly property QtObject battery: QtObject {
		readonly property string chargeIcon: "󱐋"
		readonly property string pluggedIcon: ""

        readonly property color lowColor: "#f3f353"
        readonly property color criticalColor: "#ff5555"
		readonly property color chargeColor: "#80ff80"
		readonly property color color: root._colors.primary
    }
}

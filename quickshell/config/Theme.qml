pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property Colors _colors: Colors {}

    readonly property QtObject font: QtObject {
        readonly property string family: "DejaVu Sans"
		readonly property string monospace: "JetBrainsMono NF"

		readonly property QtObject sizes: QtObject {
			readonly property int smaller: 14
			readonly property int small: 15
			readonly property int normal: 16
			readonly property int large: 17
		}
    }

    readonly property QtObject bar: QtObject {
        readonly property int height: 35
        readonly property int rounding: 15

        readonly property int spacing: 15
    }

    readonly property QtObject colors: QtObject {
        readonly property color fg: root._colors.primary
        readonly property color bg: root._colors.surface_container_low
        // readonly property color bg_alt: root._colors.surface_container_high
        readonly property color bg_alt: root._colors.primary_container
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

        readonly property color criticalColor: "#dc143c"
        readonly property color lowColor: "#f5c71a"
		readonly property color chargeColor: "#3cb371"
		readonly property color color: root._colors.primary
    }
}

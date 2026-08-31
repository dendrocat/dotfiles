pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property Colors _colors: Colors {}

    readonly property QtObject font: QtObject {
        readonly property QtObject family: QtObject {
            readonly property string normal: "Adwaita Sans"
            readonly property string monospace: "JetBrainsMono NF"
            readonly property string icon: "Material Symbols Rounded"
        }

        readonly property QtObject sizes: QtObject {
            property int smallest: 11
            property int smaller: 13
            property int small: 15
            property int normal: 16
            property int large: 17

			property int icon: 19
        }
    }

    readonly property QtObject sizes: QtObject {
        readonly property int height: 36
        readonly property int margin: 16

        readonly property int inner_height: 26
        readonly property int inner_margin: 8

        readonly property int rounding: 16
        readonly property int spacing: 15
    }

    readonly property QtObject colors: QtObject {
        readonly property color fg: root._colors.primary
        readonly property color bg: root._colors.surface_container_low
        // readonly property color bg_alt: root._colors.surface_container_high
        readonly property color on_bg: root._colors.secondary_container
        readonly property color brc: root._colors.surface_bright

        readonly property color error: root._colors.error
    }

    readonly property QtObject workspace: QtObject {
        readonly property color bg: root._colors.surface_container_high
        readonly property color inactive: root._colors.surface_variant
        readonly property color hover: root._colors.inverse_primary
        readonly property color active: root._colors.primary
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

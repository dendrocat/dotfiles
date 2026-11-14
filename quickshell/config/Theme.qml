pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property QtObject font: QtObject {
        readonly property QtObject family: QtObject {
            readonly property string normal: "Google Sans Flex"
            readonly property string monospace: "JetBrainsMono NF"
            readonly property string icon: "Material Symbols Rounded"
        }

        readonly property QtObject sizes: QtObject {
            property int smallest: 10
            property int smaller: 12
            property int small: 15
            property int normal: 16
            property int large: 18

            property int icon: 19
        }
    }

    readonly property QtObject sizes: QtObject {
        readonly property int height: 32
        readonly property int margin: 16

        readonly property int inner_height: 24
        readonly property int inner_margin: 6

        readonly property int rounding: 10
        readonly property int spacing: 15

		readonly property int edge: 35
		readonly property int edgeRounding: 15
    }

    readonly property ThemeColors colors: ThemeColors {}
    component ThemeColors: QtObject {
        readonly property color fg: Colors.pallete.primary // qmllint disable missing-property
        readonly property color bg: Colors.pallete.surface_container_low // qmllint disable missing-property

        readonly property color on_bg: Colors.pallete.on_secondary // qmllint disable missing-property

        readonly property color sep: Colors.pallete.surface_bright // qmllint disable missing-property
        readonly property color error: Colors.pallete.error // qmllint disable missing-property
    }

	readonly property ThemeWorkspace workspace : ThemeWorkspace {}
    component ThemeWorkspace: QtObject {
        readonly property color bg: Colors.pallete.on_secondary // qmllint disable missing-property
        readonly property color inactive: Colors.pallete.secondary_container // qmllint disable missing-property
        readonly property color hover: Colors.pallete.inverse_primary // qmllint disable missing-property
        readonly property color active: Colors.pallete.primary // qmllint disable missing-property
    }

	readonly property ThemeBattery battery : ThemeBattery {}
    component ThemeBattery: QtObject {
        readonly property color criticalColor: "#dc143c"
        readonly property color lowColor: "#f5c71a"
        readonly property color chargeColor: "#3cb371"
        readonly property color color: Colors.pallete.primary // qmllint disable missing-property
    }
}

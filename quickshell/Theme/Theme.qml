pragma Singleton

import QtQuick

QtObject {
    readonly property QtObject font: QtObject {
        readonly property string family: "DejaVu Sans"
        readonly property int size: 14
    }

    readonly property QtObject colors: QtObject {
        readonly property Colors _colors: Colors {}

        readonly property color primary: _colors.primary
        readonly property color bg: _colors.surface_container_low
        readonly property color brc: _colors.surface_bright
        readonly property color workspace_color: _colors.inverse_primary
        readonly property color workspace_hover_color: _colors.secondary
        readonly property color workspace_hover_bg: _colors.secondary_container
    }

	readonly property QtObject sizes : QtObject {
		readonly property int barHeight: 30
		readonly property int barRounding: 15

		readonly property int barSpacing: 5
	}
}

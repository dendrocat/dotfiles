pragma Singleton

import QtQuick
import Quickshell

Singleton {
	id: root
	readonly property QtObject battery : QtObject {
        readonly property int critical: 10
        readonly property int low: 20
	}

	readonly property QtObject workspace : QtObject {
		readonly property int persistent: 5
	}

	readonly property QtObject audio : QtObject {
		readonly property real step: 0.02
	}

	readonly property QtObject brightness : QtObject {
		readonly property real step: 0.05

		readonly property real low: 0.1
		readonly property real base: 0.8
	}
}

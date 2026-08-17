pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root
	readonly property QtObject battery : QtObject {
        readonly property int critical: 10
        readonly property int low: 20
	}

	readonly property QtObject workspace : QtObject {
		readonly property int persistent: 5
	}
}

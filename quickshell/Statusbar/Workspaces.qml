import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config

Item {
	id: root
    required property ShellScreen screen
	readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)

	implicitHeight: Theme.bar.inner_height // qmllint disable missing-property
	implicitWidth: row.implicitWidth + Theme.bar.margin // qmllint disable missing-property

	Rectangle {
		anchors.fill: parent
		color: Theme.workspace.bg // qmllint disable missing-property
		radius: Theme.bar.rounding // qmllint disable missing-property
	}

	RowLayout {
		id: row
	}
}

import QtQuick
import qs.widgets
import qs.config

MouseArea {
	id: root

	hoverEnabled: true

    implicitWidth: Theme.sizes.inner_height
    implicitHeight: Theme.sizes.inner_height

    Rectangle {
        anchors.fill: parent
        anchors.margins: 2

        radius: height / 4
        color: Theme.colors.on_bg
		visible: root.containsMouse
    }

    Icon {
        icon: "notifications"
        anchors.centerIn: parent
        color: Theme.colors.fg
    }
}

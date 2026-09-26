import QtQuick
import qs.widgets
import qs.config

MouseArea {
	id: root

	hoverEnabled: true

    implicitWidth: Theme.sizes.inner_height // qmllint disable missing-property
    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property

    Rectangle {
        anchors.fill: parent
        anchors.margins: 2

        radius: height / 4
        color: Theme.colors.on_bg // qmllint disable missing-property
		visible: root.containsMouse
    }

    Icon {
        icon: "notifications"
        anchors.centerIn: parent
        color: Theme.colors.fg // qmllint disable missing-property
    }
}

import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.config

Item {
    id: root

    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property
    implicitWidth: layout.implicitWidth + Theme.sizes.inner_margin // qmllint disable missing-property

    Rectangle {
        anchors.fill: parent

        radius: Theme.sizes.rounding // qmllint disable missing-property

        color: Theme.workspace.bg // qmllint disable missing-property
    }

    RowLayout {
        id: layout

		anchors.centerIn: parent
        spacing: Theme.sizes.spacing / 2 // qmllint disable missing-property

        Network { }

		Bluetooth {}

		Notifications {
            Layout.rightMargin: -3
		}
    }
}

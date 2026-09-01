import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

MouseArea {
    id: root

	acceptedButtons: Qt.LeftButton
	hoverEnabled: true

    implicitHeight: Theme.sizes.height // qmllint disable missing-property
    implicitWidth: layout.width

    RowLayout {
        id: layout

        anchors.centerIn: parent

        spacing: 3

        StyledText {
            id: timeText

            text: DateTime.time
            size: Theme.font.sizes.large // qmllint disable missing-property
        }

        StyledText {
            monospace: true

            text: "•"
        }

        StyledText {
            id: dateText

            text: DateTime.date
            size: Theme.font.sizes.small // qmllint disable missing-property
        }
    }

	TimeTooltip {
		anchorItem: root
		visible: root.containsMouse
	}
}

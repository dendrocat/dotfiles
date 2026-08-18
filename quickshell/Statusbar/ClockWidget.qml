import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    id: root

    implicitHeight: Theme.bar.height
    implicitWidth: layout.width

    RowLayout {
        id: layout

		anchors.centerIn: parent

        spacing: 3

        StyledText {
            id: timeText

            text: DateTime.time

			size: Theme.font.sizes.large
        }

        StyledText {
            monospace: true

            text: "•"
        }

        StyledText {
            id: dateText

            font.pixelSize: Theme.font.sizes.small

            text: DateTime.date
        }
    }
}

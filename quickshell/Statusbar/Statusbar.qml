import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

PanelWindow {
    id: bar

    implicitHeight: Theme.sizes.barHeight + Theme.sizes.barRounding
	// implicitHeight: 100

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        bottom: -Theme.sizes.barRounding
    }

    color: "transparent"

    Rectangle {
        anchors {
            top: barContent.top
            bottom: barContent.bottom
            left: barContent.left
            right: barContent.right
        }

        color: Theme.colors.bg
    }

    Item {
        anchors {
            top: barContent.bottom
            left: parent.left
            right: parent.right
        }

        RoundCorner {
            id: leftCorner
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }

            corner: RoundCorner.CornerEnum.TopLeft

            implicitSize: Theme.sizes.barRounding
            color: Theme.colors.bg
        }

        RoundCorner {
            id: rightCorner
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }

            corner: RoundCorner.CornerEnum.TopRight

            implicitSize: Theme.sizes.barRounding
            color: Theme.colors.bg
        }
    }

    Item {
        id: barContent

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        implicitHeight: Theme.sizes.barHeight

        RowLayout {
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            spacing: Theme.sizes.barSpacing


            ClockWidget {}

            Battery {}
        }
    }
}

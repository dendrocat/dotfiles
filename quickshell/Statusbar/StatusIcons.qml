import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    implicitHeight: Theme.bar.inner_height
    implicitWidth: layout.implicitWidth + 18

    Rectangle {
        anchors.fill: parent

        radius: Theme.bar.rounding

        color: Theme.workspace.bg
    }

    RowLayout {
        id: layout

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Theme.bar.spacing

        StyledText {
            id: iconNetwork
            monospace: true
            text: "󰤢"
        }

        StyledText {
            monospace: true
            text: "󰂯"
        }

        StyledText {
            rightPadding: 1
            monospace: true
            text: "󰂜"
        }
    }
}

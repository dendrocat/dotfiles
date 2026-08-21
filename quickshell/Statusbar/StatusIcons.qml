import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.config

Item {
    id: root

    implicitHeight: Theme.bar.inner_height // qmllint disable missing-property
    implicitWidth: layout.implicitWidth + Theme.bar.margin // qmllint disable missing-property

    Rectangle {
        anchors.fill: parent

        radius: Theme.bar.rounding // qmllint disable missing-property

        color: Theme.workspace.bg // qmllint disable missing-property
    }

    RowLayout {
        id: layout

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Theme.bar.spacing // qmllint disable missing-property

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

import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    implicitHeight: Theme.bar.height

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing
    }

    // Center
    RowLayout {
        anchors.centerIn: parent

        ClockWidget {}
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

        AudioControls {}

        Battery {}

        StatusIcons {}
    }
}

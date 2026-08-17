import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    implicitHeight: Theme.bar.height

    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

        ClockWidget {}

        Battery {}
    }
}

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

import Quickshell.Services.UPower

Item {
    id: root

    implicitHeight: Theme.bar.height

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

		Volume {}
    }


    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

        Battery {}

        ClockWidget {}
    }
}

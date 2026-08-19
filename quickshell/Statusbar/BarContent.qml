import Quickshell
import Quickshell.Widgets
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

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

        Volume {}
    }

    // Center
    RowLayout {
        anchors.centerIn: parent

        ClockWidget {}

        CircularProgress {
            size: Theme.bar.inner_height
            value: 0.6

            progressColor: Theme.colors.fg
            backgroundColor: Theme.colors.bg_alt
        }
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing

        Battery {}

        StatusIcons {}
    }
}

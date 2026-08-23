import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    implicitHeight: Theme.bar.height // qmllint disable missing-property

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: Theme.bar.margin // qmllint disable missing-property
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing // qmllint disable missing-property

        Workspaces {}

        Tray {}
    }

    // Center
    RowLayout {
        anchors.centerIn: parent

        ClockWidget {}
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: Theme.bar.margin // qmllint disable missing-property

        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.bar.spacing // qmllint disable missing-property

        KbLayout {}

        BrightnessControl {}

        AudioControls {}

        Battery {}

        StatusIcons {}
    }
}

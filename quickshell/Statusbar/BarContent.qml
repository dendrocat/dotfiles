import QtQuick
import QtQuick.Layouts
import qs.config
import qs.widgets

Item {
    id: root

    readonly property int leftWidth: leftContent.implicitWidth
    readonly property int centerWidth: centerContent.implicitWidth
    readonly property int rightWidth: rightContent.implicitWidth

    implicitHeight: Theme.sizes.height // qmllint disable missing-property

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    // Left
    RowLayout {
        id: leftContent
        anchors.left: parent.left
        anchors.leftMargin: Theme.sizes.margin // qmllint disable missing-property
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.sizes.spacing // qmllint disable missing-property

        Workspaces {}

        Tray {}
    }

    // Center
    RowLayout {
        id: centerContent
        anchors.centerIn: parent

        ClockWidget {}
    }

    // Right
    RowLayout {
        id: rightContent
        anchors.right: parent.right
        anchors.rightMargin: Theme.sizes.margin // qmllint disable missing-property

        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.sizes.spacing // qmllint disable missing-property

        KbLayout {}

        BrightnessControl {}

        AudioControls {}

        Battery {}

        StatusIcons {}
    }
}

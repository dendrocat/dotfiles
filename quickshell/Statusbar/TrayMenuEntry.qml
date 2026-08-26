pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.widgets
import qs.config

MouseArea {
    id: root
    acceptedButtons: Qt.LeftButton
    hoverEnabled: true

    required property QsMenuEntry entry

    property int itemWidth: 0
    readonly property int rowWidth: row.implicitWidth

	readonly property int spacing: 10

    implicitWidth: root.itemWidth + (submenuIcon.implicitWidth + root.spacing) + Theme.bar.margin
    implicitHeight: root.isSeparator() ? 1 : row.implicitHeight + 6

    function isSeparator() { return root.entry?.isSeparator ?? true; }
    function isEnabled() { return root.entry?.enabled ?? false; }
    function icon() { return root.entry?.icon ?? ""; }
    function hasSubmenu() { return root.entry?.hasChildren ?? false; }

    Rectangle {
        anchors.fill: parent
        color: Theme._colors.primary_container
        opacity: 0.5
        border.width: 1
        border.color: Theme.colors.fg
        radius: 5

        visible: root.containsMouse && !root.isSeparator() && root.isEnabled()
    }

    RowLayout {
        id: row
        anchors.verticalCenter: parent.verticalCenter
		spacing: 0

        Image {
            Layout.leftMargin: root.spacing

            source: root.icon()
            visible: root.icon() !== ""
        }

        StyledText {
            id: menuText
            Layout.leftMargin: root.icon() === "" ? root.spacing : 0
            Layout.fillWidth: true

            text: root.entry?.text ?? ""
            size: Theme.font.sizes.small

            color: root.isEnabled() ? Theme.colors.fg : Theme.colors.on_bg
        }
    }

    Icon {
		id: submenuIcon

		anchors.verticalCenter: parent.verticalCenter
		anchors.right: parent.right

        icon: "chevron_right"
        visible: root.hasSubmenu()

        color: Theme.colors.fg
    }

    signal action
    signal openSubMenu(handle: QsMenuHandle)

    onClicked: e => {
        if (entry.hasChildren) {
            root.openSubMenu(root.entry);
            return;
        }
        entry.triggered();
        root.action();
    }
}

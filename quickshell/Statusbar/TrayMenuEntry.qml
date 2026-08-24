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

    implicitWidth: loader.item.implicitWidth
    implicitHeight: loader.item.implicitHeight

    Loader {
        id: loader
        active: root.entry != null

        Connections {
            target: root
            function onEntryChanged() {
                loader.active = root.entry != null;
            }
        }

        sourceComponent: Item {
            implicitWidth: root.itemWidth > 0 ? root.itemWidth : row.implicitWidth
            implicitHeight: root.entry.isSeparator ? 1 : row.implicitHeight + 6

            Rectangle {
                anchors.fill: parent
                color: Theme._colors.primary_container
                opacity: 0.5
                border.width: 1
                border.color: Theme.colors.fg
                radius: 5

                visible: root.containsMouse && !root.entry.isSeparator && root.entry.enabled
            }

            RowLayout {
                id: row
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    source: root.entry.icon
                }

                StyledText {
                    id: menuText
                    text: root.entry.text
                    size: Theme.font.sizes.small
					color: root.entry.enabled ? Theme.colors.fg : Theme.colors.on_bg
                }
            }
        }
    }
    Component.onCompleted: {
        console.log(root.entry.text);
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

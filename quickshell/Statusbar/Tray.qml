pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import qs.widgets
import qs.services
import qs.config

Item {
    id: root

    visible: SystemTray.items.values.length !== 0

    implicitHeight: Theme.bar.inner_height // qmllint disable missing-property
    implicitWidth: row.implicitWidth + Theme.bar.margin // qmllint disable missing-property

    Rectangle {
        anchors.fill: parent
        color: Theme.workspace.bg // qmllint disable missing-property
        radius: Theme.bar.rounding // qmllint disable missing-property
    }

    RowLayout {
        id: row
        anchors.centerIn: parent

        Repeater {
            model: SystemTray.items.values.length
            delegate: MouseArea {
                id: trayItem

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                implicitHeight: Theme.bar.inner_height
                implicitWidth: Theme.bar.inner_height

                required property int index
                readonly property SystemTrayItem item: SystemTray.items.values[index]

                Image {
                    anchors.fill: parent
                    anchors.margins: 2
                    source: trayItem.item.icon
                }

                onClicked: e => {
                    if (e.button === Qt.LeftButton)
                        item.activate();
                    else {
                        item.display(trayItem.window, 0, 0);
                    }
                    e.accepted = true;
                }

                LazyLoader {
                    id: menu
                    loading: false
                    function open() { menu.loading = true; }
					component: TrayMenu {}
                }
            }
        }
    }
}

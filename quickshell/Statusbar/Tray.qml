pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import qs.config

Item {
    id: root

    visible: SystemTray.items.values.length !== 0

    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property
    implicitWidth: row.implicitWidth + Theme.sizes.inner_margin * 2 // qmllint disable missing-property

    property var activeMenu: null

    function setActiveWindow(window) {
        if (root.activeMenu && root.activeMenu != window) {
            root.activeMenu.close();
        }
        root.activeMenu = window;
    }

    function closeWindow() {
        root.activeMenu = null;
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.workspace.bg // qmllint disable missing-property
        radius: Theme.sizes.rounding // qmllint disable missing-property
    }

    RowLayout {
        id: row
        anchors.centerIn: parent

        Repeater {
            model: SystemTray.items.values.length
            delegate: MouseArea {
                id: trayItem

                acceptedButtons: Qt.LeftButton | Qt.RightButton

				property int size: Theme.sizes.inner_height - Theme.sizes.inner_margin / 2
                implicitHeight: size
                implicitWidth: size

                required property int index
                readonly property SystemTrayItem item: SystemTray.items.values[index]

                Image {
                    anchors.fill: parent
                    anchors.margins: 2
                    source: trayItem.item.icon
                }

                onClicked: e => {
                    if (e.button === Qt.LeftButton) item.activate();
                    else {
                        if (menu.active) menu.item.close();
                        else menu.open();
                    }
                    e.accepted = true;
                }

                LazyLoader {
                    id: menu
                    active: false
                    function open() {
                        menu.active = true;
                    }
                    component: TrayMenu {
                        Component.onCompleted: this.open()
                        menuHandle: trayItem.item.menu
                        anchorItem: trayItem

                        onMenuOpened: w => root.setActiveWindow(w)

                        onMenuClosed: {
                            menu.active = false;
                            root.closeWindow();
                        }
                    }
                }
            }
        }
    }
}

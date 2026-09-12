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
            model: SystemTray.items
            delegate: MouseArea {
                id: trayItem
                required property SystemTrayItem modelData

                acceptedButtons: Qt.LeftButton | Qt.RightButton

				property int size: Theme.sizes.inner_height - Theme.sizes.inner_margin / 2
                implicitHeight: size
                implicitWidth: size


                Image {
                    anchors.fill: parent
                    anchors.margins: 2
                    source: trayItem.modelData.icon
                }

                onClicked: e => {
                    if (e.button === Qt.LeftButton) modelData.activate();
                    else {
                        if (menu.active) menu.modelData.close();
                        else menu.open();
                    }
                    e.accepted = true;
                }

                Loader {
                    id: menu
                    active: false
                    function open() {
                        menu.active = true;
                    }
                    sourceComponent: TrayMenu {
                        Component.onCompleted: this.open()
                        menuHandle: trayItem.modelData.menu
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

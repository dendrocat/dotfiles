pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.widgets
import qs.config

PopupWindow {
    id: root

    implicitWidth: stack.implicitWidth + Theme.bar.margin
    implicitHeight: stack.implicitHeight + Theme.bar.margin

    Behavior on implicitWidth {
        PropertyAnimation {
            duration: 120
			easing.type: Easing.InOutSine
        }
    }
    Behavior on implicitHeight {
        PropertyAnimation {
            duration: 120
			easing.type: Easing.InOutSine
        }
    }

    required property QsMenuHandle menuHandle

    signal menuOpened(qsWindow: var)
    signal menuClosed

    function open() {
        root.visible = true;
        root.menuOpened(root);
    }

    function close() {
        root.visible = false;
        while (stack.depth > 1)
            stack.pop();
        root.menuClosed();
    }

    function openSubMenu(handle: QsMenuHandle) {
        stack.push(subMenu.createObject(null, {
            handle: handle,
            isSubMenu: true
        }));
    }

    color: "transparent"

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        onEntered: closeTimer.stop()
        onExited: closeTimer.restart()

        Rectangle {
            anchors.fill: parent
            color: Theme.colors.bg
            radius: 5
            border {
                width: 1
                color: Theme.colors.brc
            }
        }

        StackView {
            id: stack
            anchors {
                centerIn: parent
            }

            implicitWidth: currentItem.implicitWidth
            implicitHeight: currentItem.implicitHeight

            initialItem: Menu {
                handle: root.menuHandle
            }
        }
    }

    component Menu: ColumnLayout {
        id: menuLayout

        required property QsMenuHandle handle
        property bool isSubMenu: false
        property bool shown: false
        opacity: shown ? 1 : 0

        Component.onCompleted: shown = true
        StackView.onActivating: shown = true
        StackView.onDeactivating: shown = false
        StackView.onRemoved: destroy()

        QsMenuOpener {
            id: opener
            menu: menuLayout.handle
        }

        spacing: 0

        Loader {
            Layout.fillWidth: true
            Layout.minimumWidth: 70

            active: menuLayout.isSubMenu
            visible: active
            sourceComponent: MouseArea {
                id: mouse
                hoverEnabled: true
                implicitHeight: 27
                acceptedButtons: Qt.LeftButton
                onClicked: stack.pop()
                Rectangle {
                    anchors.fill: parent
                    color: Theme._colors.primary_container
                    opacity: 0.5
                    border.width: 1
                    border.color: Theme.colors.fg
                    radius: 5

                    visible: mouse.containsMouse
                }
                RowLayout {
                    spacing: 0
                    anchors.verticalCenter: parent.verticalCenter
                    Icon {
						Layout.leftMargin: 5
                        icon: "chevron_left"
                        color: Theme.colors.fg
                    }

                    StyledText {
                        text: "Back"
                    }
                }
            }
        }

        Repeater {
            id: repeater
            model: opener.children

            onModelChanged: {
                if (model.values.length === 0)
                    stack.pop();
            }

            delegate: TrayMenuEntry {
                required property var modelData
                entry: modelData

                onOpenSubMenu: subHandle => root.openSubMenu(subHandle)
                onAction: root.close()
            }

            function setMaxWidth() {
                let max = 0;
                for (let i = 0; i < repeater.count; ++i) {
                    const item = repeater.itemAt(i);
                    if (item)
                        max = Math.max(max, item.rowWidth);
                }
                for (let i = 0; i < repeater.count; ++i) {
                    const item = repeater.itemAt(i);
                    if (item)
                        item.itemWidth = max;
                }
            }
            Component.onCompleted: setMaxWidth()
            onCountChanged: setMaxWidth()
        }
    }

    Timer {
        id: closeTimer
        interval: 2000
        running: false
        onTriggered: root.close()
    }

    Component {
        id: subMenu
        Menu {}
    }
}

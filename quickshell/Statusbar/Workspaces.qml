import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.services
import qs.config

Item {
    id: root

    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property
    implicitWidth: row.implicitWidth + Theme.sizes.inner_margin * 2 // qmllint disable missing-property

    Rectangle {
        anchors.fill: parent
        color: Theme.workspace.bg // qmllint disable missing-property
        radius: Theme.sizes.rounding // qmllint disable missing-property
    }

    RowLayout {
        id: row
        anchors.centerIn: parent

        Repeater {
            model: HyprWorkspaces.workspaces.length
            delegate: MouseArea {
                id: workspaceItem
                hoverEnabled: true

                required property int index
                readonly property var workspace: HyprWorkspaces.workspaces[index]
                readonly property int ws_id: workspace?.id ?? workspaceItem.index + 1

                property int size: Theme.sizes.inner_height - Theme.sizes.inner_margin // qmllint disable missing-property
                implicitWidth: {
                    if (workspace && workspace.focused)
                        return size * 2;
                    return size;
                }
                implicitHeight: size

                Rectangle {
                    anchors.fill: parent
                    radius: workspaceItem.size

                    readonly property bool isEmpty: !workspaceItem.workspace
                    readonly property bool isHovered: workspaceItem.containsMouse
                    readonly property bool isFocused: !isEmpty && workspaceItem.workspace.focused

                    color: {
                        if (isEmpty) return isHovered ? Theme.workspace.hover : Theme.workspace.inactive; // qmllint disable missing-property
                        if (isFocused) return Theme.workspace.active; // qmllint disable missing-property
                        if (isHovered) return Theme.workspace.hover; // qmllint disable missing-property
                        return Theme.workspace.active; // qmllint disable missing-property
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }
                }

                StyledText {
                    anchors.fill: parent

					monospace: true
                    text: workspaceItem.ws_id
                    size: Theme.font.sizes.small // qmllint disable missing-property

                    color: Theme.colors.bg // qmllint disable missing-property
                }

                onClicked: {
                    if (workspace && workspace.focused) return;
                    HyprWorkspaces.focusOnWorkspaceWithId(ws_id);
                }

                Behavior on implicitWidth {
                    PropertyAnimation {
                        duration: 100
                    }
                }
            }
        }
    }
}

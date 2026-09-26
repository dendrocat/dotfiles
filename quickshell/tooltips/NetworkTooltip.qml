import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.services
import qs.config

StyledPopup {
    id: root

    side: StyledPopup.WindowSide.Right

    readonly property bool connected: NetworkService.isConnected

    ColumnLayout {
        id: layout
        anchors.centerIn: parent

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            text: "No connection"
            visible: !root.connected
        }

        Repeater {
            model: NetworkService.models
            visible: root.connected

            delegate: RowLayout {
                id: networkItem
                required property int index
                required property var modelData

                spacing: 5
                readonly property int size: Theme.font.sizes.small // qmllint disable missing-property

                Icon {
                    icon: networkItem.modelData.connected ? "adjust" : "circle"
                    color: Theme.colors.fg // qmllint disable missing-property
                }
                StyledText {
                    text: {
                        if (networkItem.modelData.connected)
                            return `${networkItem.modelData.name} (${Math.round(networkItem.modelData.strength * 100)}%, ${networkItem.modelData.type})`;
                        return `No connection (${networkItem.modelData.type})`;
                    }
                    size: networkItem.size
                }
            }
        }
    }
}

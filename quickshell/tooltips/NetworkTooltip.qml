import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.services
import qs.config

StyledPopup {
    id: root

    side: StyledPopup.WindowSide.Right

    tooltipWidth: layout.implicitWidth
    tooltipHeight: layout.implicitHeight


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
                readonly property int size: Theme.font.sizes.small

				Icon {
					icon: modelData.connected ? "adjust" : "circle"
					color: Theme.colors.fg
				}
                StyledText {
                    text: {
                        if (modelData.connected)
                            return `${modelData.name} (${Math.round(modelData.strength * 100)}%, ${modelData.type})`;
                        return `No connection (${modelData.type})`;
                    }
                    size: networkItem.size
                }
            }
        }
    }
}

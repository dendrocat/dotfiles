import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.services
import qs.config

StyledPopup {
    id: root

    side: StyledPopup.WindowSide.Right

    tooltipHeight: layout.implicitHeight
    tooltipWidth: layout.implicitWidth

    readonly property bool noConnected: BluetoothService.connectedDevices.length === 0

    ColumnLayout {
        id: layout
        anchors.centerIn: parent

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            text: {
                if (root.noConnected) return "No connected devices";
                return `${BluetoothService.connectedDevices.length} devices`;
            }
        }

        Rectangle {
            Layout.fillWidth: true
            color: Theme.colors.fg
            implicitHeight: 1
            visible: !root.noConnected
        }

        StyledText {
            text: {
                const deviceStrings = BluetoothService.connectedDevices.map((d, idx) => `${String(idx + 1).padStart(2, ' ')}. ${d.name} (${Math.round(d.battery * 100)}%)`);
                return deviceStrings.join("\n");
            }
            size: Theme.font.sizes.small
            visible: !root.noConnected
        }
    }
}

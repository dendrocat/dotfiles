import QtQuick
import Quickshell
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

MouseArea {
    id: root

    acceptedButtons: Qt.LeftButton
    hoverEnabled: true

    implicitWidth: Theme.sizes.inner_height
    implicitHeight: Theme.sizes.inner_height

    Rectangle {
        anchors.fill: parent
        anchors.margins: 2

        radius: height / 4
        color: Theme.colors.on_bg
        visible: root.containsMouse
    }

    Icon {
        anchors.centerIn: parent
        icon: {
            if (!BluetoothService.enabled)
                return "bluetooth_disabled";
            if (BluetoothService.connectedDevices.length > 0)
                return "bluetooth_connected";
            return "bluetooth";
        }
        color: Theme.colors.fg
    }

    onClicked: {
        Quickshell.execDetached(["blueman-manager"]);
    }

    BluetoothTooltip {
		anchorItem: root
		visible: BluetoothService.enabled && root.containsMouse
    }
}

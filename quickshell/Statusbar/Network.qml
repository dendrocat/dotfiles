import QtQuick
import Quickshell
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

MouseArea {
    id: root

    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true

	implicitWidth: Theme.sizes.inner_height
	implicitHeight: Theme.sizes.inner_height

    readonly property real value: NetworkService.strength

    readonly property list<string> icons: ["signal_wifi_0_bar", "network_wifi_1_bar", "network_wifi_2_bar", "network_wifi_3_bar", "network_wifi", "signal_wifi_4_bar"]

    readonly property string iconNoNetwork: "signal_wifi_connected_no_internet_4"
    readonly property string iconWifiOff: "signal_wifi_off"

    readonly property string iconEthernet: "lan"

	Rectangle {
		anchors.fill: parent
		anchors.margins: 2

		radius: height / 4
		color: Theme.colors.on_bg
		visible: root.containsMouse
	}

    Icon {
        id: iconItem

        anchors.centerIn: parent

        icon: {
            if (!NetworkService.isConnected) return root.iconNoNetwork;
            if (NetworkService.ethernet) return root.iconEthernet;
            const n = root.icons.length;
            const idx = Math.min(n - 1, Math.floor(root.value * n));
            return root.icons[idx];
        }
        color: Theme.colors.fg
    }

    onClicked: e => {
        let cmd;
        if (e.button === Qt.LeftButton) cmd = ["nm-applet", "--indicator"];
        else cmd = ["pkill", "nm-applet"];
        Quickshell.execDetached(cmd);
    }

	NetworkTooltip {
		anchorItem: root
		visible: root.containsMouse
	}
}

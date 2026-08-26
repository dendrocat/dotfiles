import QtQuick
import Quickshell
import qs.widgets
import qs.services
import qs.config

MouseArea {
    id: root

	acceptedButtons: Qt.LeftButton | Qt.RightButton

	implicitWidth: iconItem.implicitWidth
	implicitHeight: iconItem.implicitHeight

	readonly property real value: Network.strength

    readonly property list<string> icons: ["signal_wifi_0_bar", "network_wifi_1_bar", "network_wifi_2_bar", "network_wifi_3_bar", "network_wifi", "signal_wifi_4_bar"]

    readonly property string iconNoNetwork: "signal_wifi_connected_no_internet_4"
	readonly property string iconWifiOff: "signal_wifi_off"

    readonly property string iconEthernet: "lan"

    Icon {
        id: iconItem
        icon: {
			if (Network.noConnection) return root.iconNoNetwork
			if (Network.ethernet) return root.iconEthernet 
            const n = root.icons.length;
            const idx = Math.min(n - 1, Math.floor(root.value * n));
            return root.icons[idx];
        }
		color: Theme.colors.fg
    }

	onClicked: (e) => {
		let cmd;
		if (e.button === Qt.LeftButton) cmd = ["nm-applet", "--indicator"]
		else cmd = ["pkill", "nm-applet"]
		Quickshell.execDetached(cmd)
	}
}

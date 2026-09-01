pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
    id: root

	readonly property bool noConnection: Networking.connectivity === NetworkConnectivity.Unknown || Networking.connectivity === NetworkConnectivity.None

    property NetworkDeviceModel device: null

    readonly property bool isConnected: !noConnection && (device?.connected ?? false)
    readonly property bool wifi: isConnected && device.isWifi
    readonly property bool ethernet: isConnected && device.isEthernet

    readonly property real strength: device?.strength ?? 0

    property list<NetworkDeviceModel> models

    component NetworkDeviceModel: Item {
        id: model

        required property NetworkDevice device
        property var activeNetwork: null

        readonly property bool connected: device.connected && activeNetwork !== null
        readonly property bool isWifi: device.type === DeviceType.Wifi
        readonly property bool isEthernet: device.type === DeviceType.Wired

        readonly property real strength: {
            if (isEthernet) return device.hasLink ? 1 : 0;
            return activeNetwork?.signalStrength ?? 0;
        }
        readonly property string name: activeNetwork?.name ?? ""
        readonly property string type: DeviceType.toString(device.type)

        function updateActiveNetwork(e: string) {
            const dev = model.device;
            if (dev.type === DeviceType.Wired) { activeNetwork = dev.network; return; }

            activeNetwork = dev.networks.values.find(n => n.connected);
            if (!activeNetwork && dev.connected) { retryTimer.restart(); return; }
        }

        Timer {
            id: retryTimer
            interval: 1000
            running: false
            onTriggered: model.updateActiveNetwork()
        }

        Connections {
            target: model.device
            function onConnectedChanged() {
                if (!model.connected && model.device == root.device) { root.update(); return; }
                model.updateActiveNetwork();
            }
        }

        Component.onCompleted: updateActiveNetwork()
		Component.onDestruction: retryTimer.stop()
    }

    Component {
        id: networkDeviceModel
        NetworkDeviceModel {}
    }

	function update() {
		for (const model of models) model.destroy()
        models = [];

        for (const netDevice of Networking.devices.values)
            models.push(networkDeviceModel.createObject(null, { device: netDevice }));

        let model = models.find(m => m.device.connected);
        if (!model) { device = null; return; }
        device = model;
    }

    Connections {
        target: Networking
        function onConnectivityChanged() { root.update(); }
    }

    Connections {
        target: Networking.devices
        function onValuesChanged() { root.update(); }
    }

    Component.onCompleted: root.update()
}

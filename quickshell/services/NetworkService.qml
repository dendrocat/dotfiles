pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
    id: root

    property list<DeviceModel> models
    Connections {
        target: Networking.devices
        function onValuesChanged() { root.update(); }
    }

    property DeviceModel activeModel
    property bool wifi: activeModel && activeModel.connected && activeModel.device.type === DeviceType.Wifi
    property bool ethernet: activeModel && activeModel.connected && activeModel.device.type === DeviceType.Wired
    readonly property bool connected: wifi || ethernet

    readonly property real strength: activeModel?.strength ?? 0
    readonly property string name: activeModel?.name ?? ""

    Component.onCompleted: root.update()

    function update() {
        models = [];
        for (const netDevice of Networking.devices.values) {
            models.push(devModel.createObject(null, { device: netDevice }));
        }
        let model = models.find(m => m.device.connected);
        if (!model) { activeModel = null; return; }
        activeModel = model;
    }

    component DeviceModel: Item {
        id: model
        required property NetworkDevice device
        property var activeNetwork: null

        readonly property bool connected: activeNetwork !== null && device.connected
        readonly property string name: activeNetwork?.name ?? ""
        readonly property real strength: {
            if (!activeNetwork)
                return 0;
            return activeNetwork?.hasLink ? 1 : activeNetwork.signalStrength;
        }
        readonly property string type: DeviceType.toString(device.type)

        function updateActiveNetwork() {
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
                if (!model.connected && model.device == root.activeModel) { root.update(); return; }
                model.updateActiveNetwork();
            }
        }
        Connections {
            target: model.device.networks
            function onValuesChanged() {
                model.updateActiveNetwork();
            }
        }

        Component.onCompleted: updateActiveNetwork()
    }

    Component {
        id: devModel
        DeviceModel {}
    }
}

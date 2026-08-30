pragma Singleton

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
    readonly property bool noConnection: !wifi && !ethernet

    readonly property real strength: activeModel?.activeNetwork?.signalStrength ?? 0
    readonly property string name: activeModel?.activeNetwork?.name ?? ""

    Component.onCompleted: { root.update(); }

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
        readonly property bool connected: activeNetwork !== null && device.connected
        property var activeNetwork: null

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
            target: model.device.networks
            function onValuesChanged() { model.updateActiveNetwork(); }
        }

        Component.onCompleted: updateActiveNetwork()
    }

    Component {
        id: devModel
        DeviceModel {}
    }
}

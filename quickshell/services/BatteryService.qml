pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.UPower
import qs.config

Singleton {
    id: root

    property BatteryModel battery: null

    readonly property bool isAvailable: battery?.isAvailable ?? false
    readonly property real value: battery?.percentage ?? 0

    readonly property bool isCritical: battery?.isCritical ?? false
    readonly property bool isLow: battery?.isLow ?? false
    readonly property bool isFull: battery?.isFull ?? false

    readonly property bool isOnBattery: UPower.onBattery
    readonly property bool isCharging: battery?.isCharging ?? false
    readonly property bool isPlugged: battery?.isPlugged ?? false

    readonly property real energyRate: battery?.energyRate ?? 0
    readonly property real timeToEmpty: battery?.timeToEmpty ?? 0
    readonly property real timeToFull: battery?.timeToFull ?? 0
    readonly property real health: battery?.health ?? 0

    function notify(device: UPowerDevice, title: string, msg: string, level = "normal") {
        if (!device.isLaptopBattery) title = device.model + " - " + title;
        Quickshell.execDetached(["notify-send", title, msg, "--transient", "-u", level]);
    }

    component BatteryModel: QtObject {
        required property UPowerDevice device

        readonly property real percentage: device.percentage
        readonly property var state: device.state

        readonly property bool isAvailable: device.ready

        readonly property bool isCritical: isAvailable && (percentage <= Config.battery.critical / 100) // qmllint disable missing-property
        readonly property bool isLow: isAvailable && (percentage <= Config.battery.low / 100) // qmllint disable missing-property
        readonly property bool isFull: isAvailable && (percentage >= 1)

        readonly property bool isCharging: state === UPowerDeviceState.Charging
        readonly property bool isPlugged: isCharging || state === UPowerDeviceState.PendingCharge

        readonly property real energyRate: device.changeRate
        readonly property real timeToEmpty: device.timeToEmpty
        readonly property real timeToFull: device.timeToFull
        readonly property real health: device.healthPercentage

        onIsLowChanged: {
            if (!isLow || isCharging || isCritical) return;
            root.notify(device, "Low battery", "Please charge");
        }

        onIsCriticalChanged: {
            if (!isCritical || isCharging) return;
            root.notify(device, "Critical battery level", "Please charge now", "critical");
        }

        onIsChargingChanged: {
            if (!isFull || isCharging) return;
            root.notify(device, "Battery charged", "Please unplug the charger");
        }
    }

    Component {
        id: batteryModel
        BatteryModel {}
    }

    property var batteryModels: ({})

    function updateDevices() {
        const devs = new Set();
        for (const d of UPower.devices.values) {
            if (!d.isPresent) continue;

			const key = d.model
            devs.add(key);
            if (key in batteryModels) continue;

            const model = batteryModel.createObject(null, { device: d });
            batteryModels[key] = model;
            if (d.isLaptopBattery) root.battery = model;
        }

        for (const key in batteryModels) {
            if (devs.has(key)) continue;

            const model = batteryModels[key];
            model.destroy();
            delete batteryModels[key];
        }
    }

    Component.onCompleted: { root.updateDevices(); }

    Connections {
        target: UPower.devices
        function onValuesChanged() { root.updateDevices(); }
    }
}

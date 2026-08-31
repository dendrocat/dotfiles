pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower
import qs.config

Singleton {
    id: root

    property UPowerDevice device: UPower.displayDevice
    readonly property real value: device.percentage

    readonly property bool isAvailable: device.ready

    readonly property bool isCritical: isAvailable && (value <= Config.battery.critical / 100) // qmllint disable missing-property
    readonly property bool isLow: isAvailable && (value <= Config.battery.low / 100) // qmllint disable missing-property
    readonly property bool isFull: isAvailable && (value >= 1)

    readonly property bool onBattery: UPower.onBattery
    readonly property bool isCharging: device.state == UPowerDeviceState.Charging
    readonly property bool isPlugged: isCharging || device.state == UPowerDeviceState.PendingCharge

    property real energyRate: device.changeRate
    property real timeToEmpty: device.timeToEmpty
    property real timeToFull: device.timeToFull
    property real health: device.healthPercentage

    function nofify(title, msg, level = "normal") {
        Quickshell.execDetached(["notify-send", title, msg, "--transient", "-u", level]);
    }

    onIsLowChanged: {
        if (!isLow || isCharging) return;
        nofify("Low battery", "Please charge");
    }

    onIsCriticalChanged: {
        if (!isCritical || isCharging) return;
        nofify("Critical battery level", "Please charge now", "critical");
    }

    onIsChargingChanged: {
        if (!isPlugged || isCharging) return;
        nofify("Battery charged", "Please unplug the charger");
    }

	function findBattery() {
        const battery = UPower.devices.values.find(d => d.type === UPowerDeviceType.Battery && d.nativePath);
        if (!battery || root.device === battery) return;
        root.device = battery;
	}

    Component.onCompleted: findBattery()

	Connections {
		target: UPower.devices
		function onValuesChanged() { root.findBattery() }
	}
}

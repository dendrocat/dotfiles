pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import qs.config

Singleton {
    id: root

    readonly property real value: UPower.displayDevice.percentage

	readonly property bool isAvailable: UPower.displayDevice.ready;

    readonly property bool isCritical: isAvailable && (value <= Config.battery.critical / 100); // qmllint disable missing-property
    readonly property bool isLow: isAvailable && (value <= Config.battery.low / 100); // qmllint disable missing-property
	readonly property bool isFull: isAvailable && (value >= 1);

    property bool isCharging: UPower.displayDevice.state == UPowerDeviceState.Charging;
    readonly property bool isPlugged: isCharging || UPower.displayDevice.state == UPowerDeviceState.PendingCharge;

    property real energyRate: UPower.displayDevice.changeRate;
    property real timeToEmpty: UPower.displayDevice.timeToEmpty;
    property real timeToFull: UPower.displayDevice.timeToFull;

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
        if (!isFull || isCharging) return;
        nofify("Battery charged", "Please unplug the charger");
    }
}

pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
	id: root

	readonly property bool enabled: Bluetooth.defaultAdapter?.enabled ?? false

	readonly property list<BluetoothDevice> connectedDevices: Bluetooth.devices.values.filter(d => d.connected)
	readonly property list<BluetoothDevice> pairedDevices: Bluetooth.devices.values.filter(d => !d.connected && d.paired)
	readonly property list<BluetoothDevice> unpairedDevices: Bluetooth.devices.values.filter(d => !d.paired)
}

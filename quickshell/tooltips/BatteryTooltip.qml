import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.services

StyledPopup {
    id: root

    tooltipWidth: layout.implicitWidth
    tooltipHeight: layout.implicitHeight

    side: StyledPopup.WindowSide.Right

    ColumnLayout {
        id: layout
        anchors.centerIn: parent


        StyledText {
            text: `Battery ${BatteryService.device.model}`
        }
        StyledText {
            text: `Empty in ${DateTime.formatSecondsTime(BatteryService.timeToEmpty)}`
			visible: BatteryService.onBattery
        }
        StyledText {
            text: `Full in ${DateTime.formatSecondsTime(BatteryService.timeToFull)}`
			visible: BatteryService.isPlugged
        }
        StyledText {
			text: `Usage: ${BatteryService.energyRate.toFixed(2)} W`
        }
        StyledText {
			text: `Condition: ${BatteryService.health.toFixed(2)}%`
        }
    }
}

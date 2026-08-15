import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import qs.Config

Item {
    id: root

    implicitWidth: row.implicitWidth
    implicitHeight: Theme.bar.height

    readonly property real value: UPower.displayDevice.percentage
    readonly property int low: Config.battery.low
    readonly property int critical: Config.battery.critical

    readonly property bool isLow: value <= low / 100
    readonly property bool isCritical: value <= critical / 100
    readonly property bool isCharging: UPower.displayDevice.state == UPowerDeviceState.Charging
    readonly property bool isPlugged: UPower.displayDevice.state == UPowerDeviceState.PendingCharge

    RowLayout {
        id: row

        anchors.verticalCenter: parent.verticalCenter

        ClippedProgressBar {
            implicitWidth: root.implicitHeight * 1.3
            implicitHeight: root.implicitHeight * 0.5

            value: root.value

            progressColor: {
                if (root.isCritical) return Theme.battery.criticalColor;
                if (root.isLow) return Theme.battery.lowColor;
                return Theme.battery.color;
            }

            backgroundColor: Theme.colors.bg_alt

            StyledText {
                anchors {
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom

                    leftMargin: 5
                }
                topPadding: 0

                monospace: true
                size: Theme.font.size - 1

                visible: root.isCharging || !root.isPlugged

                text: {
                    if (root.isCharging) return Theme.battery.chargeIcon;
                    return Theme.battery.pluggedIcon;
                }

				color: {
					if (root.isLow) return Theme._colors.inverse_primary
					return Theme.colors.bg
				}
            }
        }

        Item {
            Layout.alignment: Qt.AlignVCenter
            implicitWidth: metric.width
            implicitHeight: perText.implicitHeight

            TextMetrics {
                id: metric
                text: "000"
                font.pointSize: Theme.font.size
            }

            StyledText {
                id: perText
                text: Math.round(UPower.displayDevice.percentage * 100)
                anchors.centerIn: parent
            }
        }
    }
}

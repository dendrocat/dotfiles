import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    id: root

    implicitHeight: Theme.bar.height
    implicitWidth: row.implicitWidth

    readonly property real value: Battery.value
    readonly property bool isCritical: Battery.isCritical
    readonly property bool isLow: Battery.isLow
    readonly property bool isCharging: Battery.isCharging
    readonly property bool isPlugged: Battery.isPlugged

    RowLayout {
        id: row
		anchors.centerIn: parent

        ClippedProgressBar {
            implicitWidth: root.implicitHeight
            implicitHeight: root.implicitHeight * 0.40

            value: root.value

            progressColor: {
				if (root.isCharging) return Theme.battery.chargeColor;
                if (root.isCritical) return Theme.battery.criticalColor;
                if (root.isLow) return Theme.battery.lowColor;
                return Theme.battery.color;
            }

            backgroundColor: Theme.colors.bg_alt;
        }

        Item {
            implicitWidth: metric.width

            TextMetrics {
                id: metric
                text: "000"
                font.pixelSize: Theme.font.sizes.normal
            }

            StyledText {
                id: perText
                anchors.centerIn: parent
                text: Math.round(value * 100)
            }
        }
    }
}

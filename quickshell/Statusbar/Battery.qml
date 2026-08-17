import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

Item {
    id: root

    implicitWidth: row.implicitWidth
    implicitHeight: Theme.bar.height

    readonly property real value: Battery.value
    readonly property bool isCritical: Battery.isCritical
    readonly property bool isLow: Battery.isLow
    readonly property bool isCharging: Battery.isCharging
    readonly property bool isPlugged: Battery.isPlugged

    RowLayout {
        id: row

        anchors.verticalCenter: parent.verticalCenter

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
                text: Math.round(value * 100)
                anchors.centerIn: parent
            }
        }
    }
}

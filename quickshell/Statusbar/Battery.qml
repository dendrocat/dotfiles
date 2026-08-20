import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.config
import qs.services

Item {
    id: root

    implicitHeight: Theme.bar.inner_height
    implicitWidth: bar.implicitWidth

    readonly property real value: Battery.value
    readonly property bool isCritical: Battery.isCritical
    readonly property bool isLow: Battery.isLow
    readonly property bool isCharging: Battery.isCharging
    readonly property bool isPlugged: Battery.isPlugged

    ClippedProgressBar {
        id: bar
        anchors.centerIn: parent
        implicitWidth: Theme.bar.inner_height * 1.8
        implicitHeight: Theme.bar.inner_height * 0.7

        value: root.value

        progressColor: {
            if (root.isCharging)
                return Theme.battery.chargeColor;
            if (root.isCritical)
                return Theme.battery.criticalColor;
            if (root.isLow)
                return Theme.battery.lowColor;
            return Theme.battery.color;
        }

        backgroundColor: Theme.colors.on_bg

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: 0

            Icon {
                Layout.leftMargin: -6

                icon: root.isCharging ? "bolt" : "usb"
                size: Theme.font.sizes.smaller
                visible: root.isCharging || root.isPlugged
            }

            StyledText {
                text: Math.round(root.value * 100)
                size: Theme.font.sizes.small
                weight: Font.Bold

                color: Theme.colors.bg
            }
        }
    }
}

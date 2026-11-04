import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

MouseArea {
    id: root

    hoverEnabled: true

    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property
    implicitWidth: bar.implicitWidth

    readonly property real value: BatteryService.value
    readonly property bool isCritical: BatteryService.isCritical
    readonly property bool isLow: BatteryService.isLow
    readonly property bool isCharging: BatteryService.isCharging
    readonly property bool isPlugged: BatteryService.isPlugged

    ClippedProgressBar {
        id: bar
        anchors.centerIn: parent
        implicitWidth: Theme.sizes.inner_height * 2 // qmllint disable missing-property
        implicitHeight: Theme.sizes.inner_height * 0.8 // qmllint disable missing-property

        value: root.value

        progressColor: {
            if (root.isCharging) return Theme.battery.chargeColor;
            if (root.isCritical) return Theme.battery.criticalColor;
            if (root.isLow) return Theme.battery.lowColor;
            return Theme.battery.color;
        }

        backgroundColor: Theme.colors.on_bg

        RowLayout {
            id: row
            anchors.centerIn: parent
            implicitHeight: Math.max(parent.implicitHeight, icon.implicitHeight)

            spacing: 2

            Icon {
                id: icon
                Layout.leftMargin: -4
                Layout.topMargin: 1

                icon: root.isCharging ? "bolt" : "usb"
                color: Colors.lerpSmoothed(Theme.colors.fg, Theme.colors.bg, Utils.normalize(root.value, 0.25, 0.3))

                size: Theme.font.sizes.normal // qmllint disable missing-property
                visible: root.isCharging || root.isPlugged
            }

            StyledText {
                Layout.topMargin: 2.5
                text: Math.round(root.value * 100)

                color: Colors.lerpSmoothed(Theme.colors.fg, Theme.colors.bg, Utils.normalize(root.value, 0.3, 0.6))

                outline: true
                outlineColor: Colors.lerpSmoothed(Theme.colors.bg, Theme.colors.fg, Utils.normalize(root.value, 0.3, 0.6))
            }
        }
    }

    BatteryTooltip {
        anchorItem: root
        visible: root.containsMouse
    }
}

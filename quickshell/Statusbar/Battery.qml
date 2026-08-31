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
            if (root.isCharging) return Theme.battery.chargeColor; // qmllint disable missing-property
            if (root.isCritical) return Theme.battery.criticalColor; // qmllint disable missing-property
            if (root.isLow) return Theme.battery.lowColor; // qmllint disable missing-property
            return Theme.battery.color; // qmllint disable missing-property
        }

        backgroundColor: Theme.colors.on_bg // qmllint disable missing-property

        RowLayout {
            id: row
            anchors.centerIn: parent
            height: Math.max(parent.implicitHeight, icon.implicitHeight)
            spacing: 2

            Icon {
                id: icon
                Layout.leftMargin: -6
				Layout.alignment: Qt.AlignBaseline

                icon: root.isCharging ? "bolt" : "usb"
                size: Theme.font.sizes.normal // qmllint disable missing-property
                visible: root.isCharging || root.isPlugged
            }

            StyledText {
                text: Math.round(root.value * 100)
                size: Theme.font.sizes.small // qmllint disable missing-property

                color: Theme.colors.bg // qmllint disable missing-property
            }
        }
    }

	BatteryTooltip {
		anchorItem: root
		visible: root.containsMouse
	}
}

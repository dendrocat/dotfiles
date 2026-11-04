import QtQuick
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

ScrollMouseArea {
    id: root
	hoverEnabled: true

    implicitWidth: Theme.sizes.inner_height // qmllint disable missing-property
    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property

    readonly property real value: BrightnessService.brightness

    readonly property list<string> icons: ["wb_twilight", "wb_sunny"]

    FilledCircularProgress {
        anchors.centerIn: parent
        value: root.value

        Icon {
            anchors.centerIn: parent
            icon: {
                const n = root.icons.length;
                const idx = Math.min(n - 1, Math.floor(root.value * n));
                return root.icons[idx];
            }
                color: Colors.lerpSmoothed(Theme.colors.fg, Theme.colors.bg, root.value)

                outline: true
                outlineColor: Colors.lerpSmoothed(Theme.colors.bg, Theme.colors.fg, Utils.normalize(root.value, 0.3, 0.6))
        }
    }

    onScrollUp: BrightnessService.incrementBrightness()
    onScrollDown: BrightnessService.decrementBrightness()

	BrightnessTooltip {
		anchorItem: root
		visible: root.containsMouse
	}
}

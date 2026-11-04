import QtQuick
import qs.widgets
import qs.tooltips
import qs.services
import qs.config

ScrollMouseArea {
    id: root
    property int size: Theme.sizes.inner_height // qmllint disable missing-property

    implicitHeight: size
    implicitWidth: size

    required property var node
    readonly property bool muted: AudioService.isMuted(node)
    readonly property real value: AudioService.volume(node)

    required property string mutedIcon
    required property list<string> icons

    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true

    signal openControls

    FilledCircularProgress {
        size: root.implicitHeight

        progressColor: Theme.colors.fg
        backgroundColor: Theme.colors.on_bg

        value: root.value

        Icon {
            anchors.centerIn: parent
            icon: {
                if (root.muted) return root.mutedIcon;
                if (root.icons.length == 1) return root.icons[0];
                const n = root.icons.length;
                const idx = Math.min(n - 1, Math.floor(root.value * n));
                return root.icons[idx];
            }
			color: Colors.lerpSmoothed(Theme.colors.fg, Theme.colors.bg, root.value)

			outline: true
			outlineColor: Colors.lerpSmoothed(Theme.colors.bg, Theme.colors.fg, Utils.normalize(root.value, 0.3, 0.6))
        }
    }

    onScrollUp: AudioService.incrementVolume(node)
    onScrollDown: AudioService.decrementVolume(node)

    onClicked: event => {
        if (event.button === Qt.LeftButton) AudioService.toggleMute(node);
        else openControls();
    }

    AudioTooltip {
        anchorItem: root
        node: root.node
        visible: root.containsMouse
    }
}

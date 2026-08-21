import QtQuick
import qs.widgets
import qs.services
import qs.config

ScrollMouseArea {
    id: root
    property int size: Theme.bar.inner_height // qmllint disable missing-property

    implicitHeight: size
    implicitWidth: size

    required property var node
    readonly property bool muted: Audio.isMuted(node)
    readonly property real value: Audio.volume(node)

    required property string mutedIcon
    required property list<string> icons

	acceptedButtons: Qt.LeftButton | Qt.RightButton

	signal openControls()

    FilledCircularProgress {
        size: root.implicitHeight

        progressColor: Theme.colors.fg // qmllint disable missing-property
        backgroundColor: Theme.colors.on_bg // qmllint disable missing-property

        value: root.value

        Icon {
            anchors.centerIn: parent
            icon: {
                if (root.muted) return root.mutedIcon;
                if (root.icons.length == 1) return root.icons[0];
				const n = root.icons.length
                const idx = Math.min(n - 1, Math.floor(root.value * n));
                return root.icons[idx];
            }
        }
    }

    onScrollUp: Audio.incrementVolume(node)
    onScrollDown: Audio.decrementVolume(node)

	onClicked: event => {
		if (event.button === Qt.LeftButton) Audio.toggleMute(node)
		else openControls()
	}

}

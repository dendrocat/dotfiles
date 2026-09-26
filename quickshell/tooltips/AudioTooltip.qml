import qs.widgets
import qs.services

StyledPopup {
    id: root

    required property var node

    side: StyledPopup.WindowSide.Right

    StyledText {
        id: text
		anchors.centerIn: parent
        text: `${AudioService.readableName(root.node)} ${Math.round(AudioService.volume(root.node) * 100)}%`
    }
}

import qs.widgets
import qs.services

StyledPopup {
    id: root

    required property var node

    side: StyledPopup.WindowSide.Right

    StyledText {
        id: text
		anchors.centerIn: parent
        text: `${AudioService.readableName(node)} ${Math.round(AudioService.volume(node) * 100)}%`
    }
}

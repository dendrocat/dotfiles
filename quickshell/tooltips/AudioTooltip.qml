import qs.widgets
import qs.services

StyledPopup {
    id: root

    required property var node

    tooltipWidth: text.implicitWidth
    tooltipHeight: text.implicitHeight

    side: StyledPopup.WindowSide.Right

    StyledText {
        id: text
		anchors.centerIn: parent
        text: `${AudioService.readableName(node)} ${Math.round(AudioService.volume(node) * 100)}%`
    }
}

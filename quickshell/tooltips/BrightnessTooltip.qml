import qs.widgets
import qs.services

StyledPopup {
    id: root

    side: StyledPopup.WindowSide.Right

    StyledText {
        id: text
		anchors.centerIn: parent
		text: `${Math.round(BrightnessService.brightness * 100)}%`
    }
}

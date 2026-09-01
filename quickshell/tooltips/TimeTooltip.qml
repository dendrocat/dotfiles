import qs.widgets
import qs.services

StyledPopup {
    id: root

    tooltipWidth: text.implicitWidth
    tooltipHeight: text.implicitHeight

    side: StyledPopup.WindowSide.Right

    StyledText {
        id: text
		anchors.centerIn: parent
        text: DateTime.long_date
    }
}

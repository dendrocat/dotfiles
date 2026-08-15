import Quickshell
import QtQuick
import qs.Config

Item {
	id: clock

	property string timeFormat: "HH:mm"

	property string dateFormat: "dd.MM.yyyy"

	implicitWidth: timeText.implicitWidth

	SystemClock {
		id: sysClock
		precision: SystemClock.Minutes
	}

	StyledText {
		id: timeText

		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}

		text: Qt.formatDateTime(sysClock.date, clock.timeFormat + " " + clock.dateFormat)
	}
}

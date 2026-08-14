import Quickshell
import QtQuick
import qs.Theme

Item {
	id: clock

	property string timeFormat: "HH:mm"

	property string dateFormat: "dd.MM.yyyy"

	implicitWidth: timeText.implicitWidth

	SystemClock {
		id: sysClock
		precision: SystemClock.Minutes
	}

	Text {
		id: timeText

		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}

		text: Qt.formatDateTime(sysClock.date, clock.timeFormat + " " + clock.dateFormat)

		color: Theme.colors.primary

		font {
			family: Theme.font.family
			pixelSize: Theme.font.size
		}
	}
}

import Quickshell
import QtQuick
import qs.config
import qs.services

Item {
	id: root
	implicitWidth: timeText.implicitWidth

	StyledText {
		id: timeText

		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}

		text: DateTime.time
	}

	StyledText {
		id: dateText

		text: DateTime.date
	}
}

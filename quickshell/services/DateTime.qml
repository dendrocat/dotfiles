pragma Singleton

import QtQuick
import Quickshell

Singleton {
	readonly property var clock : SystemClock {
		precision: SystemClock.Minutes;
	}

	readonly property string time: Qt.locale().toString(clock.date, "hh:mm");
	readonly property string date: Qt.locale().toString(clock.date, "dd.MM.yyyy");
	readonly property string long_date: Qt.locale().toString(clock.date, "dddd, dd MMMM, yyyy");
}

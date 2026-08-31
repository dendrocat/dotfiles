pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property var clock: SystemClock {
        precision: SystemClock.Minutes
    }

    function format(formattingDate: date, format: string): string {
        return formattingDate.toLocaleString(Qt.locale(), format);
    }

    readonly property string time: format(clock.date, "hh:mm")
    readonly property string date: format(clock.date, "dd.MM.yyyy")
    readonly property string long_date: format(clock.date, "dddd, dd MMMM, yyyy")

    function formatSecondsTime(durationSec: int): string {
        const ms = durationSec * 1000;
        let date = new Date(ms);
        date.setMinutes(date.getMinutes() + date.getTimezoneOffset());
        return format(date, "h 'h' m 'm'");
    }
}

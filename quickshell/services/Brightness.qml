pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.config

Singleton {
    id: root
    property real brightness: 0

    readonly property Process initProc: Process {
        running: false
        command: ["sh", "-c", "echo $(brightnessctl g) $(brightnessctl m)"]
        stdout: StdioCollector {
            onStreamFinished: {
                const [cur, max] = text.split(" ");
                root.brightness = cur / max;
                updateTimer.running = true;
            }
        }
    }

    Timer {
        id: updateTimer
        interval: 1000
        repeat: true
        onTriggered: root.initProc.running = true
    }


    function setBrightness(value: real) {
        value = Math.max(0, Math.min(1, value));
        const rounded = Math.round(value * 100);

        if (Math.round(brightness * 100) === rounded)
            return;
        brightness = value;
        Quickshell.execDetached(["brightnessctl", "s", `${rounded}%`]);
    }

    function increaseBrightness() {
        setBrightness(brightness + Config.brightness.step); // qmllint disable missing-property
    }

    function decreaseBrightness() {
        setBrightness(brightness - Config.brightness.step); // qmllint disable missing-property
    }

    Component.onCompleted: {
        initProc.running = true;
    }
}

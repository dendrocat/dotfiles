pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.config

Singleton {
    id: root
    property real previous: 0
    property real brightness: 0

    readonly property Process initProc: Process {
        running: false
        command: ["sh", "-c", "echo $(brightnessctl g) $(brightnessctl m)"]
        stdout: StdioCollector {
            onStreamFinished: {
                const [cur, max] = text.split(" ");
                root.brightness = cur / max;
            }
        }
    }

    function setBrightness(value: real, save = false) {
        value = Math.max(0.05, Math.min(1, value));
        const rounded = Math.round(value * 100);

        if (Math.round(brightness * 100) === rounded) return;
		previous = brightness;
        brightness = value;
		let arr = ["brightnessctl", "s", `${rounded}%`]
		if (save) arr.push("-s")
        Quickshell.execDetached(arr);
    }

    function incrementBrightness() {
        setBrightness(brightness + Config.brightness.step); // qmllint disable missing-property
    }

    function decrementBrightness() {
        setBrightness(brightness - Config.brightness.step); // qmllint disable missing-property
    }

    Component.onCompleted: {
        initProc.running = true;
    }

    IpcHandler {
        target: "brightness"

        function increment()	{ root.incrementBrightness(); }
        function decrement()	{ root.decrementBrightness(); }
        function low()			{ root.setBrightness(Config.brightness.low, true); } // qmllint disable missing-property
        function restore()		{ root.setBrightness(root.previous); } // qmllint disable missing-property
    }
}

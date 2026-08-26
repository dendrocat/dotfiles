pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property bool wifi: true
    property bool ethernet: false
    readonly property bool noConnection: !wifi && !ethernet

    property string name: ""

    property real strength: 0

    function update() {
        updateNetwork.running = true;
        updateConnection.running = true;
        updateTimer.restart();
    }
    Component.onCompleted: {
        root.update();
    }

    property int mon_line: 0

    Process {
        id: updateConnection
        running: false
        command: ["sh", "-c", "nmcli -t -f TYPE,STATE d && nmcli -t -f CONNECTIVITY g"]
        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n");
                const connectivity = lines.pop();
                let wifi = false;
                let ethernet = false;
                lines.forEach(line => {
                    if (line.startsWith("ethernet") && line.endsWith("connected"))
                        ethernet = false;
                    else if (line.startsWith("wifi:")) {
                        if (line.endsWith("connected")) {
                            wifi = (connectivity === "full");
                        }
                    }
                });
                root.wifi = wifi;
                root.ethernet = ethernet;
            }
        }
    }

    Process {
        id: updateNetwork
        running: false
        command: ["sh", "-c", "nmcli -f IN-USE,SIGNAL,SSID device wifi | awk '/^\\*/{{print $0}}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text.length === 0) {
                    root.strength = 0;
                    root.name = "";
                    return;
                }
                const reg = /\*\s+(\d{2,3})\s+(.+)/;
                const [_, strength, name] = reg.exec(text);
                root.strength = strength / 100;
                root.name = name.trim();
            }
        }
    }

    Timer {
        id: updateTimer
        interval: 10000
        repeat: true
        running: false
        onTriggered: root.update()
    }

    Process {
        id: nmcliMonitor
        running: true
        command: ["nmcli", "monitor"]
        stdout: SplitParser {
            onRead: root.update()
        }
        onExited: monitorRestart.start() // qmllint disable signal-handler-parameters
    }

    Timer {
        id: monitorRestart
        interval: 2000
        running: false
        onTriggered: nmcliMonitor.running = true
    }
}

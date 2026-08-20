import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

RowLayout {
    id: root

    spacing: Theme.bar.spacing

    AudioControl {
        node: Audio.sink

        mutedIcon: "volume_off"
        icons: ["volume_mute", "volume_down", "volume_up"]

        onOpenControls: {
            Quickshell.execDetached(["pavucontrol", "-t", "3"]);
        }
    }

    AudioControl {
        node: Audio.source

        mutedIcon: "mic_off"
        icons: ["mic"]

        onOpenControls: {
            Quickshell.execDetached(["pavucontrol", "-t", "4"]);
        }
    }
}

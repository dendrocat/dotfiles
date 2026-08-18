pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import qs.config

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [sink, source]
    }

    readonly property real volume: sink?.audio.volume ?? 0

    function decrementVolume() {
        Audio.sink.audio.volume = Math.max(0, Audio.volume - Config.audio.volumeStep);
    }

    function incrementVolume() {
        Audio.sink.audio.volume = Math.min(1, Audio.volume + Config.audio.volumeStep);
    }
}

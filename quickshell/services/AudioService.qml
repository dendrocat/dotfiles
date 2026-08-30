pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import qs.config

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [root.sink, root.source]
    }

    function isMuted(node: PwNode): bool {
        return (node === null) || node.audio.muted;
    }

    function volume(node: PwNode): real {
        return isMuted(node) ? 0 : node.audio.volume;
    }

	function setVolume(node: PwNode, volume: real) {
        if (isMuted(node)) return;
		node.audio.volume = Math.max(0, Math.min(1, volume));
	}

    function decrementVolume(node: PwNode) {
        setVolume(node, node.audio.volume - Config.audio.step); // qmllint disable missing-property
    }

    function incrementVolume(node: PwNode) {
        setVolume(node, node.audio.volume + Config.audio.step); // qmllint disable missing-property
    }

    function toggleMute(node: PwNode) {
		if (node === null) return;
        node.audio.muted = !node.audio.muted;
    }
}

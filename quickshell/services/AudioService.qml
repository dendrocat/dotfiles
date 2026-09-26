pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
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

    function readableName(node: PwNode): string {
        if (!node) return "";
        if (node.nickname.length !== 0) return node.nickname;
        if (node.description.length !== 0) return node.description;
        return node.name;
    }

	IpcHandler {
		target: "audio"

		function increment()	{ root.incrementVolume(root.sink);	}
		function decrement()	{ root.decrementVolume(root.sink);	}
		function mute()			{ root.toggleMute(root.sink);		}
	}
	IpcHandler {
		target: "micro"

		function increment()	{ root.incrementVolume(root.source);	}
		function decrement()	{ root.decrementVolume(root.source);	}
		function mute()			{ root.toggleMute(root.source);			}
	}
}

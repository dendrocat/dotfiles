pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function lerpColorSmoothed(c1, c2, t) {
        let smooth = t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
        return lerpColor(c1, c2, smooth);
    }
    function lerpColor(c1, c2, t) {
		return Qt.rgba(
			c1.r + (c2.r - c1.r) * t,
			c1.g + (c2.g - c1.g) * t,
			c1.b + (c2.b - c1.b) * t,
			c1.a + (c2.a - c1.a) * t);
    }

    function normalize(x, start, end) {
        return Math.max(0, Math.min(1, (x - start) / (end - start)));
    }
}

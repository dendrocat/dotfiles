pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function normalize(x, start, end) {
        return Math.max(0, Math.min(1, (x - start) / (end - start)));
    }
}

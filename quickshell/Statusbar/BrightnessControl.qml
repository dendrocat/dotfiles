import QtQuick
import qs.widgets
import qs.services
import qs.config

ScrollMouseArea {
    id: root
    implicitWidth: Theme.sizes.inner_height // qmllint disable missing-property
    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property

    readonly property real value: Brightness.brightness

    readonly property list<string> icons: ["wb_twilight", "wb_sunny"]
    FilledCircularProgress {
        anchors.centerIn: parent
        value: root.value

        Icon {
            anchors.centerIn: parent
            icon: {
                const n = root.icons.length;
                const idx = Math.min(n - 1, Math.floor(root.value * n));
                return root.icons[idx];
            }
        }
    }

    onScrollUp: Brightness.increaseBrightness()
    onScrollDown: Brightness.decreaseBrightness()
}

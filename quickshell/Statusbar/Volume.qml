import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

ScrollMouseArea {
    id: root
    implicitHeight: Theme.bar.inner_height
    implicitWidth: layout.width

    readonly property real value: Audio.volume

    RowLayout {
        id: layout
        anchors.centerIn: parent

        ClippedProgressBar {
            implicitWidth: Theme.bar.inner_height * 1.2
            implicitHeight: Theme.bar.inner_height * 0.6

            progressColor: Theme.colors.fg
            backgroundColor: Theme.colors.bg_alt

            value: root.value
        }

        StyledText {
            text: Math.round(root.value * 100)
        }
    }

    onScrollUp: delta => Audio.incrementVolume()
    onScrollDown: delta => Audio.decrementVolume()
}

import QtQuick
import qs.services
import qs.widgets
import qs.config

Item {
    id: root
    implicitHeight: Theme.bar.inner_height
    implicitWidth: metrics.width + Theme.bar.margin

    Rectangle {
        anchors.fill: parent
        radius: root.implicitHeight
		color: Theme.workspace.bg
    }

    TextMetrics {
        id: metrics
        text: "000"
        font {
            family: txt.font.family
            pixelSize: txt.font.pixelSize
        }
    }

    StyledText {
        id: txt
        anchors.centerIn: parent

        text: HyprlandKb.layout
        size: Theme.font.sizes.smaller
    }
}

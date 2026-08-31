import QtQuick
import qs.services
import qs.widgets
import qs.config

Item {
    id: root
    implicitHeight: Theme.sizes.inner_height // qmllint disable missing-property
    implicitWidth: metrics.width + Theme.sizes.inner_margin * 2 // qmllint disable missing-property

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

        text: HyprKb.layout
        size: Theme.font.sizes.small // qmllint disable missing-property
    }
}

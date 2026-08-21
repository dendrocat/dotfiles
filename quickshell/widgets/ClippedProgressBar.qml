pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

ProgressBar {
    id: root

    required property color backgroundColor
    required property color progressColor
    property int radius: 10

    background: Rectangle {
        anchors.fill: parent
        radius: root.radius

        color: root.backgroundColor

        clip: true
    }

    contentItem: Item {
        id: contentItem

        anchors.fill: parent

        Rectangle {
            width: parent.width * root.visualPosition
            height: parent.height

            color: root.progressColor
        }
    }

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: root.width
            height: root.height
            radius: root.radius
        }
    }
}

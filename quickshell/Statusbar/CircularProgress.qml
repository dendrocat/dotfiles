import QtQuick
import QtQuick.Shapes

Item {
    id: root
    property int size
    property real value

    property color progressColor
    property color backgroundColor

    implicitWidth: size
    implicitHeight: size

    readonly property real degree: value * 360
    readonly property real center: size / 2

    Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
    }

    Shape {
        anchors.fill: parent
        layer.enabled: true
        layer.smooth: true
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeWidth: 0
            fillColor: root.progressColor

            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            PathAngleArc {
                centerX: root.center
                centerY: root.center
                radiusX: root.size / 2
                radiusY: root.size / 2

                startAngle: 90
                sweepAngle: 180
            }
        }
    }
}

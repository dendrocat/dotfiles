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

    readonly property int lineWidth: 2
    readonly property real degree: Math.max(0, Math.min(1, value)) * 360
    readonly property real center: size / 2
    readonly property real radius: size / 2 - lineWidth

    // Rectangle {
    // 	anchors.fill: parent
    // 	color: root.backgroundColor
    // 	radius: root.size
    // }

    Shape {
        anchors.fill: parent
        layer.enabled: true
        layer.smooth: true
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: "transparent"
            strokeColor: root.progressColor
            strokeWidth: root.lineWidth
            capStyle: ShapePath.RoundCap

            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            PathAngleArc {
                centerX: root.center
                centerY: root.center
                radiusX: root.radius
                radiusY: root.radius

                startAngle: -90
                sweepAngle: -root.degree
            }
        }
        ShapePath {
            fillColor: "transparent"
            strokeColor: root.backgroundColor
            strokeWidth: root.lineWidth
            capStyle: ShapePath.RoundCap

            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            PathAngleArc {
                centerX: root.center
                centerY: root.center
                radiusX: root.radius
                radiusY: root.radius

                startAngle: -90
                sweepAngle: 360 - root.degree
            }
        }
    }
}

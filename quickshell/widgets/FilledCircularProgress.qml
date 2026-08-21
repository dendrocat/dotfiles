import QtQuick
import QtQuick.Shapes
import qs.config

Item {
    id: root

    property int size: Theme.bar.inner_height // qmllint disable missing-property
    required property real value

    property color progressColor: Theme.colors.fg // qmllint disable missing-property
    property color backgroundColor: Theme.colors.on_bg // qmllint disable missing-property

    implicitWidth: size
    implicitHeight: size

    readonly property real degree: Math.max(0, Math.min(1, value)) * 360
    readonly property real center: size / 2
    readonly property real radius: size / 2 - 0.5

    Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
        radius: root.size

        Shape {
            anchors.fill: parent
            layer.enabled: true
            layer.smooth: true
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                fillColor: root.progressColor
                strokeWidth: 0
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
                PathLine {
                    x: root.center
                    y: root.center
                }
            }
        }
    }
}

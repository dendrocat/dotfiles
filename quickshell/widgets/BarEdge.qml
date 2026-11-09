import QtQuick
import QtQuick.Shapes

import qs.config

Item {
    id: root

    enum Side { Left, Right }
    property var corner: BarEdge.Side.Left
    readonly property bool isLeft: corner === BarEdge.Side.Left

    property int edgeHeight: Theme.sizes.height
    implicitHeight: edgeHeight

    property var edgeWidth: 25
    implicitWidth: Math.max(edgeWidth, 2 * rounding)

    property int rounding: Theme.sizes.edgeRounding

    property color color: Theme.colors.bg

    readonly property int _h: implicitHeight
    readonly property int _w: implicitWidth
    readonly property int _r: rounding

    function norm(a) {
        while (a < 0) a += Math.PI * 2;
        while (a >= Math.PI * 2) a -= Math.PI * 2;
        return a;
    }

    readonly property real alpha: {
        // console.log("hello from edges")
        const A = 2 * _r - _h;
        const B = _w;
        const C = 2 * _r;
        const R = Math.sqrt(A * A + B * B) || 1;
        const base = Math.atan2(B, A);
        const dt = Math.acos(Math.min(1, C / R));

        const inRange = a => a > 0.005 && a < Math.PI / 2 - 0.005;
        const a1 = norm(base - dt);
        const a2 = norm(base + dt);
        if (inRange(a1)) return a1;
        if (inRange(a2)) return a2;
        return Math.atan2(Math.max(0.001, _h - 2 * _r), Math.max(0.001, _w - 2 * _r));
    }
	readonly property real alphaDeg: root.alpha * 180 / Math.PI

    Shape {
        id: shape

        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.color
            strokeWidth: 0
            // strokeColor: "red"

            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            PathAngleArc {
                centerX: root.isLeft ? 0 : root._w
                centerY: root._h - root._r
                radiusX: root._r
                radiusY: root._r

                startAngle: 90
                sweepAngle: (root.isLeft ? -1 : 1) * root.alphaDeg
            }
            PathLine {
                x: root.isLeft ? root._w - root._r * Math.sin(root.alpha) : root._r * Math.sin(root.alpha)
                y: root._r - root._r * Math.cos(root.alpha)
            }
            PathArc {
                radiusX: root.rounding
                radiusY: root.rounding

                x: root.isLeft ? root.implicitWidth : 0
                y: 0

                useLargeArc: false
                direction: root.isLeft ? PathArc.Clockwise : PathArc.Counterclockwise
            }
            PathLine {
                x: root.isLeft ? 0 : root._w
                y: 0
            }
        }
    }
}

import QtQuick
import Quickshell
import qs.widgets
import qs.config

PopupWindow {
    id: root

    required property Item anchorItem

    enum WindowSide { Left, Right }
    property var side: StyledPopup.WindowSide.Left
    property bool isLeft: side === StyledPopup.WindowSide.Left

    property real tooltipWidth: 0
    property real tooltipHeight: 0

    implicitWidth: tooltipWidth + Theme.sizes.rounding * 2 + Theme.sizes.inner_margin * 2 // qmllint disable missing-property
    implicitHeight: tooltipHeight + Theme.sizes.inner_margin * 2 // qmllint disable missing-property

    color: "transparent"

    Behavior on implicitWidth {
        PropertyAnimation {
            duration: 120
            easing.type: Easing.OutSine
        }
    }
    Behavior on implicitHeight {
        PropertyAnimation {
            duration: 120
            easing.type: Easing.OutSine
        }
    }

    property point shift
    Component.onCompleted: {
        shift = anchorItem.mapToGlobal(anchorItem.x, anchorItem.y);
    }

    anchor {
        item: root.anchorItem
        rect.x: {
            if (isLeft) return -(implicitWidth - anchorItem.width) / 2;
            return (implicitWidth + anchorItem.width) / 2;
        }
        rect.y: Theme.sizes.height - shift.y // qmllint disable missing-property
        edges: { // qmllint disable missing-type
            if (isLeft) return Edges.Top | Edges.Left;
            return Edges.Top | Edges.Right;
        }
        gravity: { // qmllint disable missing-type
            if (isLeft) return Edges.Bottom | Edges.Right;
            return Edges.Bottom | Edges.Left;
        }
    }

    Item {
        id: background
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            anchors.leftMargin: Theme.sizes.rounding // qmllint disable missing-property
            anchors.rightMargin: Theme.sizes.rounding // qmllint disable missing-property

            bottomLeftRadius: 5
            bottomRightRadius: 5

            color: Theme.colors.bg // qmllint disable missing-property
        }

        RoundCorner {
            corner: RoundCorner.CornerEnum.TopRight
            implicitSize: Theme.sizes.rounding // qmllint disable missing-property

            anchors.right: parent.left
            anchors.rightMargin: -Theme.sizes.rounding // qmllint disable missing-property

            color: Theme.colors.bg // qmllint disable missing-property
        }
        RoundCorner {
            corner: RoundCorner.CornerEnum.TopLeft
            implicitSize: Theme.sizes.rounding // qmllint disable missing-property

            anchors.left: parent.right
            anchors.leftMargin: -Theme.sizes.rounding // qmllint disable missing-property

            color: Theme.colors.bg // qmllint disable missing-property
        }
    }
}

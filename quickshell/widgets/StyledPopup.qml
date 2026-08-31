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

    implicitWidth: tooltipWidth + Theme.sizes.rounding * 2 + Theme.sizes.inner_margin * 2
    implicitHeight: tooltipHeight + Theme.sizes.inner_margin * 2

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

    anchor {
		item: root.anchorItem
        rect.x: Theme.sizes.rounding * (isLeft ? -1 : 3)
        rect.y: Theme.sizes.height - 7
        edges: {
            if (isLeft) return Edges.Top | Edges.Left;
            return Edges.Top | Edges.Right;
        }
        gravity: {
            if (isLeft) return Edges.Bottom | Edges.Right;
            return Edges.Bottom | Edges.Left;
        }
    }

    Item {
        id: background
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            anchors.leftMargin: Theme.sizes.rounding
            anchors.rightMargin: Theme.sizes.rounding

            bottomLeftRadius: 5
            bottomRightRadius: 5

            color: Theme.colors.bg
        }

        RoundCorner {
            corner: RoundCorner.CornerEnum.TopRight
            implicitSize: Theme.sizes.rounding

            anchors.right: parent.left
            anchors.rightMargin: -Theme.sizes.rounding

            color: Theme.colors.bg
        }
        RoundCorner {
            corner: RoundCorner.CornerEnum.TopLeft
            implicitSize: Theme.sizes.rounding

            anchors.left: parent.right
            anchors.leftMargin: -Theme.sizes.rounding

            color: Theme.colors.bg
        }
    }
}

import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell
import qs.widgets
import qs.config

PopupWindow {
    id: root

    required property Item anchorItem
	default property alias contentData : content.data

    enum WindowSide { Left, Center, Right }
    property var side: StyledPopup.WindowSide.Left
    property bool isLeft: side === StyledPopup.WindowSide.Left
    property bool isCenter: side === StyledPopup.WindowSide.Center
    property bool isRight: side === StyledPopup.WindowSide.Right

    property real tooltipWidth: contentRect.implicitWidth
    property real tooltipHeight: contentRect.implicitHeight

	readonly property real hPadding: Theme.sizes.rounding + Theme.sizes.inner_margin
	readonly property real vPadding: Theme.sizes.inner_margin

    implicitWidth: contentRect.implicitWidth + hPadding * 2
    implicitHeight: visible ? contentRect.implicitHeight + vPadding * 2 : 1

    color: "transparent"

    property point shift
    Component.onCompleted: {
        shift = anchorItem.mapToGlobal(anchorItem.x, anchorItem.y);
    }

    component Anim: PropertyAnimation {
        duration: 240
        easing.type: Easing.OutCubic
    }
    Behavior on implicitHeight { Anim {} }

    Behavior on implicitWidth { Anim {} }

    anchor {
        item: root.anchorItem
        rect.x: {
            if (isLeft) return -Theme.sizes.rounding;
            if (isCenter) return anchorItem.width / 2;
            return anchorItem.width + Theme.sizes.rounding;
        }
        rect.y: Theme.sizes.height - shift.y // qmllint disable missing-property
        edges: { // qmllint disable missing-type
            if (isLeft)
                return Edges.Top | Edges.Left;
            if (isCenter)
                return Edges.Top;
            return Edges.Top | Edges.Right;
        }
        gravity: { // qmllint disable missing-type
            if (isLeft)
                return Edges.Bottom | Edges.Right;
            if (isCenter)
                return Edges.Bottom;
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

    Rectangle {
        id: contentRect

		anchors.centerIn: parent
		anchors.leftMargin: root.hPadding
		anchors.rightMargin: root.hPadding
		anchors.topMargin: root.vPadding
		anchors.bottomMargin: root.vPadding

		color: "transparent"

		clip: true

        implicitWidth: content.childrenRect.width
        implicitHeight: content.childrenRect.height

        Item {
            id: content
			anchors.centerIn: parent
        }
    }
}

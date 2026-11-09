import Quickshell
import QtQuick
import qs.widgets
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: bar

            required property ShellScreen modelData
            screen: modelData

            implicitHeight: Theme.sizes.height + Theme.sizes.rounding // qmllint disable missing-property

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                bottom: -Theme.sizes.rounding // qmllint disable missing-property
            }

            color: "transparent"

            // Left
            Item {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom

                implicitWidth: barContent.leftWidth + Theme.sizes.edge + Theme.sizes.margin * 1.5
                implicitHeight: Theme.sizes.height + Theme.sizes.rounding

                Rectangle {
                    id: leftRect
                    anchors.left: parent.left

                    implicitWidth: barContent.leftWidth + Theme.sizes.margin * 1.5
                    implicitHeight: Theme.sizes.height

                    color: Theme.colors.bg
                }

                BarEdge {
                    anchors.left: leftRect.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    side: BarEdge.Side.Left
                    edgeHeight: Theme.sizes.height
                    edgeWidth: Theme.sizes.edge
                }

                RoundCorner {
                    id: leftCorner
                    anchors {
                        top: leftRect.bottom
                        bottom: parent.bottom
                        left: parent.left
                    }

                    corner: RoundCorner.CornerEnum.TopLeft

                    implicitSize: Theme.sizes.rounding // qmllint disable missing-property
                    color: Theme.colors.bg
                }
            }

            // Right
            Item {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                implicitWidth: barContent.rightWidth + Theme.sizes.edge + Theme.sizes.margin * 1.5
                implicitHeight: Theme.sizes.height + Theme.sizes.rounding

                Rectangle {
                    id: rightRect
                    anchors.right: parent.right

                    implicitWidth: barContent.rightWidth + Theme.sizes.margin * 1.5
                    implicitHeight: Theme.sizes.height
                    color: Theme.colors.bg
                }

                BarEdge {
                    anchors.right: rightRect.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    side: BarEdge.Side.Right
                    edgeHeight: Theme.sizes.height
                    edgeWidth: Theme.sizes.edge
                }

                RoundCorner {
                    id: rightCorner
                    anchors {
                        top: rightRect.bottom
                        bottom: parent.bottom
                        right: parent.right
                    }

                    corner: RoundCorner.CornerEnum.TopRight

                    implicitSize: Theme.sizes.rounding // qmllint disable missing-property
                    color: Theme.colors.bg
                }
            }

			// Center
            Item {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right

                implicitWidth: barContent.centerWidth + Theme.sizes.edge * 2 + Theme.sizes.margin * 2
                implicitHeight: Theme.sizes.height

                Rectangle {
                    id: centerRect
                    anchors.centerIn: parent

                    implicitWidth: barContent.centerWidth + Theme.sizes.margin * 2
                    implicitHeight: Theme.sizes.height
                    color: Theme.colors.bg
                }
                BarEdge {
                    anchors.right: centerRect.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    side: BarEdge.Side.Right
                    edgeHeight: parent.implicitHeight
                    edgeWidth: Theme.sizes.edge
                }
                BarEdge {
                    anchors.left: centerRect.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    side: BarEdge.Side.Left
                    edgeHeight: parent.implicitHeight
                    edgeWidth: Theme.sizes.edge
                }
            }

            BarContent {
                id: barContent
            }
        }
    }
}

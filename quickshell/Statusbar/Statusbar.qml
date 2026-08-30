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

            Rectangle {
                anchors {
                    top: barContent.top
                    bottom: barContent.bottom
                    left: barContent.left
                    right: barContent.right
                }

                color: Theme.colors.bg // qmllint disable missing-property
            }

            Item {
                anchors {
                    top: barContent.bottom
                    left: parent.left
                    right: parent.right
                }

                RoundCorner {
                    id: leftCorner
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        left: parent.left
                    }

                    corner: RoundCorner.CornerEnum.TopLeft

                    implicitSize: Theme.sizes.rounding // qmllint disable missing-property
                    color: Theme.colors.bg // qmllint disable missing-property
                }

                RoundCorner {
                    id: rightCorner
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }

                    corner: RoundCorner.CornerEnum.TopRight

                    implicitSize: Theme.sizes.rounding // qmllint disable missing-property
                    color: Theme.colors.bg // qmllint disable missing-property
                }
            }

            BarContent {
                id: barContent
            }
        }
    }
}

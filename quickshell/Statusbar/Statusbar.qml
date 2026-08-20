import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.config

Scope {
    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                id: bar

                required property var modelData
                screen: modelData

                implicitHeight: Theme.bar.height + Theme.bar.rounding

                anchors {
                    top: true
                    left: true
                    right: true
                }

                margins {
                    bottom: -Theme.bar.rounding
                }

                color: "transparent"

                Rectangle {
                    anchors {
                        top: barContent.top
                        bottom: barContent.bottom
                        left: barContent.left
                        right: barContent.right
                    }

                    color: Theme.colors.bg
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

                        implicitSize: Theme.bar.rounding
                        color: Theme.colors.bg
                    }

                    RoundCorner {
                        id: rightCorner
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            right: parent.right
                        }

                        corner: RoundCorner.CornerEnum.TopRight

                        implicitSize: Theme.bar.rounding
                        color: Theme.colors.bg
                    }
                }

                BarContent {
                    id: barContent
                }
            }
        }
    }
}

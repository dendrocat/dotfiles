import QtQuick
import qs.config

Text {
    id: root

    property bool monospace: false
    property int size: Theme.font.sizes.normal

    verticalAlignment: Text.AlignVCenter

    // anchors.baseline: QAn
    // topPadding: 2

    font {
        family: monospace ? Theme.font.monospace : Theme.font.family
        pixelSize: size
    }

    color: Theme.colors.fg
}

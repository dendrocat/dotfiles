import QtQuick
import qs.config

Text {
    id: root

    property bool monospace: false
    property int size: Theme.font.sizes.normal
	property int weight: Font.Normal

    verticalAlignment: Text.AlignVCenter

    font {
        family: monospace ? Theme.font.family.monospace : Theme.font.family.normal
        pixelSize: size
		weight: root.weight
    }

    color: Theme.colors.fg
}

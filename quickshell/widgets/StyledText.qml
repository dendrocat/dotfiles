import QtQuick
import qs.config

Text {
    id: root

    property bool monospace: false
    property int size: Theme.font.sizes.normal // qmllint disable missing-property
    property int weight: Font.Normal

	property bool outline: false
	property color outlineColor: Theme.colors.bg

    verticalAlignment: Text.AlignVCenter

    font {
        family: monospace ? Theme.font.family.monospace : Theme.font.family.normal // qmllint disable missing-property
        pixelSize: size
        weight: root.weight
    }

    color: Theme.colors.fg // qmllint disable missing-property

	style: outline ? Text.Outline : Text.Normal
	styleColor: outlineColor
}

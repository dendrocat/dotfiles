import QtQuick
import qs.config

Text {
    id: root

    required property string icon

    property int size: Theme.font.sizes.icon // qmllint disable missing-property

    property real weight: Font.Normal

    text: icon

    verticalAlignment: Text.AlignVCenter
	anchors.horizontalCenterOffset: -0.5
	anchors.verticalCenterOffset: 0.5

    font {
        family: Theme.font.family.icon // qmllint disable missing-property
        pixelSize: root.size
        weight: root.weight
    }

    font.variableAxes: {
        "FILL": 0,
        "wght": root.weight,
        // "GRAD": 0,
        "opsz": root.size
    }

	color: Theme.colors.bg // qmllint disable missing-property
}

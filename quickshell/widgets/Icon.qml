import QtQuick
import qs.config

StyledText {
    id: root

    required property string icon

    size: Theme.font.sizes.icon // qmllint disable missing-property

    text: icon

	anchors.horizontalCenterOffset: -1.0
	anchors.verticalCenterOffset: 0.5

    font {
        family: Theme.font.family.icon // qmllint disable missing-property
    }

    font.variableAxes: {
        "FILL": 0,
        "wght": root.weight,
        // "GRAD": 0,
        "opsz": root.size
    }
}

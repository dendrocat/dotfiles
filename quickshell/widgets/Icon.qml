import QtQuick
import qs.config

Text {
    id: root

    required property string icon

    property int size: Theme.font.sizes.smaller // qmllint disable missing-property
    readonly property int pixelSize: size * 1.5

    property real weight: Font.Normal

    text: icon

    verticalAlignment: Text.AlignVCenter
    rightPadding: 2

    font {
        family: Theme.font.family.icon // qmllint disable missing-property
        pixelSize: root.pixelSize
        weight: root.weight
    }

    font.variableAxes: {
        "FILL": 0,
        "wght": root.weight,
        // "GRAD": 0,
        "opsz": root.pixelSize
    }

	color: Theme.colors.bg // qmllint disable missing-property
}

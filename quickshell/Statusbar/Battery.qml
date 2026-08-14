import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import qs.Theme

Rectangle {
    id: battery

    implicitWidth: layout.implicitWidth + 8
    radius: 15

	color: Theme.colors.bg
	border {
		color: Theme.colors.brc
	}

    RowLayout {
        id: layout

		anchors.horizontalCenter: parent.horizontalCenter

        Text {

            Layout.alignment: Qt.AlignVCenter
            text: Math.round(UPower.displayDevice.percentage * 100)

            font.family: Theme.font.family
            font.pixelSize: Theme.font.size

            color: Theme.colors.primary
        }
    }
}

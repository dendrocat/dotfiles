import QtQuick
import qs.Config

Text {
	id: root

	property bool monospace: false
	property int size: Theme.font.size

	verticalAlignment: Text.AlignVCenter

	// anchors.baseline: QAn
	// topPadding: 2

	font {
		family: monospace ? Theme.font.monospace : Theme.font.family
		pointSize: size
	}

	color: Theme.colors.fg
}

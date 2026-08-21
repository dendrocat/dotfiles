import QtQuick

MouseArea {
    id: root

    signal scrollUp()
    signal scrollDown()

    property bool scrollTracking: false

    onEntered: {
        root.scrollTracking = true;
    }

    onExited: {
        root.scrollTracking = false;
    }

    onWheel: event => {
        if (event.angleDelta.y > 0) root.scrollUp();
        if (event.angleDelta.y < 0) root.scrollDown();
    }
}

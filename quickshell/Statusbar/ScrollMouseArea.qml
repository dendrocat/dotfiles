import QtQuick

MouseArea {
    id: root

    signal scrollUp(delta: int)
    signal scrollDown(delta: int)

    property bool scrollTracking: false

    onEntered: {
        root.scrollTracking = true;
    }

    onExited: {
        root.scrollTracking = false;
    }

    onWheel: event => {
        if (event.angleDelta.y > 0) root.scrollUp(event.angleDelta.y);
        if (event.angleDelta.y < 0) root.scrollDown(event.angleDelta.y);
    }
}

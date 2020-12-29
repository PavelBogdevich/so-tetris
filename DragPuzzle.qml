import QtQuick 2.7

MouseArea {
    id: mouseArea

    property int elementSize: 25

    drag.target: loader.item

    Loader {
        id: loader
        source: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onLoaded: {
            item.Drag.active = mouseArea.drag.active
        }
    }
    states: State {
        name: "dragStarted"
        when: mouseArea.drag.active
        AnchorChanges {
            target: loader.item
            anchors.verticalCenter: undefined
            anchors.horizontalCenter: undefined
        }
    }
    transitions: Transition {
        from: ""; to: "dragStarted"
        PropertyAnimation {
            target: loader.item
            property: "elementSize"
            to: 2 * elementSize
        }
    }
    PropertyAnimation {
        id: dragFailedAnimation
        target: loader.item
        property: "elementSize"
        to: elementSize
        duration: 10
    }

    onReleased: {
        var puzzle = loader.item;
        var p = map.mapFromItem(puzzle, 0, 0);
        puzzle.x = p.x;
        puzzle.y = p.y;
        var res = map.insert(puzzle.points);
        if (res.result) {
            puzzle.parent = map;
            var xMin = res.points[0].x;
            var yMin = res.points[0].y;
            res.points.forEach(function(p) {
                if (p.x < xMin) {
                    xMin = p.x;
                }
                if (p.y < yMin) {
                    yMin = p.y;
                }
            });
            puzzle.x = xMin;
            puzzle.y = yMin;
        }
        else {
            puzzle.anchors.verticalCenter = loader.verticalCenter;
            puzzle.anchors.horizontalCenter = loader.horizontalCenter;
            dragFailedAnimation.start();
        }
    }

    function reset() {
        var puzzle = loader.item;
        if (puzzle.parent !== loader) {
            map.reset(puzzle.points);
            puzzle.parent = loader;
            puzzle.anchors.verticalCenter = loader.verticalCenter;
            puzzle.anchors.horizontalCenter = loader.horizontalCenter;
            dragFailedAnimation.start();
        }
    }
}

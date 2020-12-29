import QtQuick 2.7

DropArea {
    width: 204
    height: 204
//    rotation: 45
    Rectangle {
        anchors.fill: parent
        border.width: 2
        border.color: "lemonchiffon"
        Grid {
            x: 2
            y: 2
            Repeater {
                id: mapRepeater
                model: 16
                delegate: MapItem {}
            }
        }
    }
    function insert(points) {
        var resItems = []
        points.forEach(function(p) {
            for (var i = 0; i < mapRepeater.count; ++i) {
                var mapItem = mapRepeater.itemAt(i);
                if (mapItem.isValid(p)) {
                    resItems.push(mapItem);
                }
            }
        });
        if (resItems.length !== points.length) {
            return {result: false};
        }
        var resPoints = [];
        resItems.forEach(function(curItem) {
            curItem.isEmpty = false;
            resPoints.push(Qt.point(curItem.x + 2, curItem.y + 2));
        });
        return {result: true, points: resPoints};
    }
    function reset(points) {
        for (var i = 0; i < mapRepeater.count; ++i) {
            mapRepeater.itemAt(i).isEmpty = true;
        }
    }
}

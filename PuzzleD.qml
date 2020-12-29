import QtQuick 2.7

Rectangle {
    property int elementSize: 25
    property var points: [
        Qt.point(x, y),
        Qt.point(x + elementSize, y),
        Qt.point(2 * elementSize + x, y),
        Qt.point(3 * elementSize + x, y)
    ]
    width: 4 * elementSize
    height: elementSize
    color: "#51A6DF"
//    rotation: 45
}

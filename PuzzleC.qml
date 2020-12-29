import QtQuick 2.7

Rectangle {
    property int elementSize: 25
    property var points: [
        Qt.point(x, y),
        Qt.point(x, y + elementSize),
        Qt.point(x + elementSize, y),
        Qt.point(x + elementSize, y + elementSize)
    ]
    width: 2 * elementSize
    height: 2 * elementSize
    color: "#E0972D"
//    rotation: 45
}

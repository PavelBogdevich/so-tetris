import QtQuick 2.7
import QtQuick.Layouts 1.3

GridLayout {
    property int elementSize: 25
    property var itemColor: "#70E038"
    property var points: [
        Qt.point(x + elementSize, y),
        Qt.point(x + elementSize, y + elementSize),
        Qt.point(x + elementSize, 2 * elementSize + y),
        Qt.point(x, 2 * elementSize + y)
    ]
    width: 2 * elementSize
    height: 3 * elementSize
//    rotation: 45
    rows: 3
    columns: 2
    rowSpacing: 0
    columnSpacing: 0
    Rectangle {
        Layout.preferredWidth: elementSize
        Layout.preferredHeight: elementSize
        color: itemColor
        Layout.row: 0
        Layout.column: 1
    }
    Rectangle {
        Layout.preferredWidth: elementSize
        Layout.preferredHeight: elementSize
        color: itemColor
        Layout.row: 1
        Layout.column: 1
    }
    Rectangle {
        Layout.preferredWidth: elementSize
        Layout.preferredHeight: elementSize
        color: itemColor
        Layout.row: 2
        Layout.column: 0
    }
    Rectangle {
        Layout.preferredWidth: elementSize
        Layout.preferredHeight: elementSize
        color: itemColor
        Layout.row: 2
        Layout.column: 1
    }
}

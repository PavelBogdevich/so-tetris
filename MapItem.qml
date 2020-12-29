import QtQuick 2.7

Rectangle {
    width: 50
    height: 50
    color: "lightgray"
    border.width: 1
    border.color: "white"

    property bool isEmpty: true

    function isValid(p) {
        return isEmpty && x - 10 < p.x && x + 10 > p.x && y - 10 < p.y && y + 10 > p.y;
    }
}

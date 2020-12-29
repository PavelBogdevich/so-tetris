import QtQuick 2.7

Image {
    id: gameHeaderButton
    width: 36
    height: 36
    anchors.centerIn: parent
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: gameHeaderButton.scale = 0.9
        onExited: gameHeaderButton.scale = 1
        onClicked: gameHeaderButton.clicked()
    }
    signal clicked()
}

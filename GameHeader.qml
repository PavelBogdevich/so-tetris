import QtQuick 2.7
import QtQuick.Layouts 1.3

RowLayout {
    id: gameHeader
    anchors.fill: parent
    property var color: "white"
    Rectangle {
        color: gameHeader.color
        Layout.fillHeight: true
        Layout.minimumWidth: 60
        Layout.preferredWidth: parent.width * 0.2
        GameHeaderButton {
            id: replayImage
            source: "images/replay.png"
            onClicked: {
                gameHeader.replayButtonClicked();
                timer.restart();
            }
        }
    }
    Rectangle {
        color: gameHeader.color
        Layout.fillWidth: true
        Layout.fillHeight: true
        GameHeaderTimer {
            id: timer
        }
    }
    Rectangle {
        color: gameHeader.color
        Layout.fillHeight: true
        Layout.preferredWidth: parent.width * 0.2
        GameHeaderButton {
            id: pauseImage
            source: "images/pause.png"
            onClicked: {
                gameHeader.pauseButtonClicked();
                timer.stop();
            }
        }
    }
    Component.onCompleted: timer.start()
    signal replayButtonClicked()
    signal pauseButtonClicked()
    function start() {
        timer.start();
    }
}

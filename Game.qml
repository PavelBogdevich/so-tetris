import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

ColumnLayout {
    id: game
    spacing: 0
    property var color: "floralwhite"
    Rectangle {
        Layout.fillWidth: true
        Layout.minimumHeight: 60
        Layout.preferredHeight: root.height * 0.1
        color: game.color
        GameHeader {
            id: gameHeader
            color: game.color
            onReplayButtonClicked: {
                puzzleRepeater.replay();
            }
            onPauseButtonClicked: {
                gamePauseDialog.width = game.width / 2;
                gamePauseDialog.height = game.height / 2;
                gamePauseDialog.open();
            }
        }
    }
    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumHeight: 220
        color: game.color
        Map {
            id: map
            anchors.centerIn: parent
        }
    }
    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: root.height * 0.3
        color: game.color
        Row {
            Repeater {
                id: puzzleRepeater
                model: ["PuzzleD.qml", "PuzzleC.qml", "PuzzleB.qml", "PuzzleA.qml"]
                delegate: DragPuzzle {
                    width: root.width / 4
                    height: root.height * 0.3
                }
                function replay() {
                    for (var i = 0; i < count; ++i) {
                        itemAt(i).reset();
                    }
                }
            }
        }
    }
    GamePauseDialog {
        id: gamePauseDialog
        onClosed: {
            if (gamePauseDialog.result === gamePauseDialog.continueResult) {
                gameHeader.start();
            }
        }
    }
}

import QtQuick 2.7
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    id: root
    width: 480
    height: 640
    visible: true
    title: qsTr("so-tetris")

    StackView {
        id: stack
        initialItem: menuComponent
        anchors.fill: parent
    }
    Component {
        id: menuComponent
        ColumnLayout {
            MenuButton {
                text: qsTr("game")
                Layout.alignment: Qt.AlignCenter
                onClicked: stack.push(gameComponent)
            }
        }
    }
    Component {
        id: gameComponent
        Game {
            id: game
        }
    }
}

import QtQuick 2.7
import QtQuick.Controls 2.5

Dialog {
    id: gamePauseDialog
    modal: true
    anchors.centerIn: parent
    readonly property int continueResult: 345
    MenuButton {
        text: qsTr("continue")
        anchors.centerIn: parent
        onClicked: onContinueButtonClicked();
    }
    Keys.onPressed: {
        if (event.key === Qt.Key_Escape) {
            onContinueButtonClicked();
        }
    }
    function onContinueButtonClicked() {
        gamePauseDialog.result = gamePauseDialog.continueResult;
        gamePauseDialog.close();
    }
}

import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Button {
    id: menuButton
    contentItem: Text {
        text: menuButton.text
        opacity: enabled ? 1.0 : 0.3
        color: menuButton.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: menuButton.down ? "#17a81a" : "#21be2b"
        border.width: 1
        radius: 2
    }
}


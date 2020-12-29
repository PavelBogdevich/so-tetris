import QtQuick 2.7

Text {
    id: gameHeaderTimer
    text: "00:00"
    anchors.centerIn: parent
    Timer {
        id: timer
        property int min: 0
        property int sec: 0
        repeat: true
        onTriggered: {
            ++sec;
            if (sec == 60) { ++min; sec = 0; }
            gameHeaderTimer.text = timeToString(min) + ":" + timeToString(sec);
        }
        function timeToString(value) {
            return value < 10 ? "0" + value.toString() : value.toString();
        }
    }
    function restart() {
        gameHeaderTimer.text = "00:00"
        timer.min = 0;
        timer.sec = 0;
        timer.restart();
    }
    function start() { timer.start(); }
    function stop() { timer.stop(); }
}

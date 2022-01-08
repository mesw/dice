import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")



    Rectangle {
        id: backgroundRect
        anchors.fill: parent

        color: "#FF91AF"
    }

    Text {
        id: diceTxt

        property int number: 0

        anchors.fill: parent

        text: "Press to roll"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        fontSizeMode: Text.Fit
        minimumPointSize: 10
        font.pointSize: 1000

        MouseArea {
            anchors.fill: parent

            onPressed: {
                diceTxt.number = DiceRandomizer.randomize()
                diceTxt.text = ""
                timer.start()
                busyIndicator.visible = true
                busyIndicator.running = true
            }
        }

        Timer {
            id: timer

            interval: 1234
            repeat: false

            onTriggered: {
                busyIndicator.visible = false
                busyIndicator.running = false
                diceTxt.text = diceTxt.number
            }
        }
    }

    BusyIndicator {
        id: busyIndicator
        running: true
        anchors.fill: parent
        visible: false
    }
}

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: window

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    FontLoader {
        id: webFont
        source: "qrc:/font/roboto/Roboto-Regular.ttf"
    }


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

        font.family: webFont.font.family
        font.weight: webFont.font.weight
        font.pointSize: 2000
        fontSizeMode: Text.Fit
        minimumPointSize: 10
        color: "#424242"


        //        renderType: Text.NativeRendering // looks great on the desktop but not working on android :(
        renderType: Text.QtRendering
        renderTypeQuality: 208 //208=Text.VeryHighRenderTypeQuality
        style: Text.Outline
        styleColor: "#000000"

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

            interval: 1000
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
        running: false
        anchors.fill: parent
        visible: false
    }
}

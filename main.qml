import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Controls.Material 2.1
import QtQuick.VirtualKeyboard 2.4

ApplicationWindow {
    id: window
    width: 800
    height: 480
    visible: true
    title: qsTr("Device Monitor")
//    header: Text{
//        id: namePage
//        text: swipe.itemAt(swipe.currentIndex).title
//        font.family: "Arial"
//        font.bold: true
//        font.pointSize: 14
//        anchors.centerIn: parent
//    }

    SwipeView {
        id:swipe
        anchors.fill: parent
        currentIndex: сarouselPages.currentIndex
        Ports {
            id: ports
        }
        Home {
            id: home
        }

        Device {
            id: device
        }
    }

        PageIndicator {
            id: сarouselPages
            count: swipe.count
            interactive: true
            currentIndex: swipe.currentIndex
            anchors.bottom: swipe.bottom
            anchors.horizontalCenter: swipe.horizontalCenter
            delegate:
                Button {
                    text: swipe.itemAt(index).title
                    highlighted: index == swipe.currentIndex ? true : false
                onClicked: {
                    swipe.setCurrentIndex(index)
                }
            }
        }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height + 20
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}

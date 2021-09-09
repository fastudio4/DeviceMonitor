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
    SwipeView {
        id:swipe
        anchors.fill: parent
        currentIndex: swipeindicator.currentIndex
        Port {}
        Home {}
    }
    footer: ToolBar {
        PageIndicator {
            id: swipeindicator
            count: swipe.count
            interactive: true
            currentIndex: swipe.currentIndex
            delegate:
                Button {
                text: swipe.itemAt(index).title
                highlighted: index == swipe.currentIndex ? false : true
                font.pointSize: 14
                onClicked: {
                    swipe.setCurrentIndex(index)
                }

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

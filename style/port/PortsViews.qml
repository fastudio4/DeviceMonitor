import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

ListView {
    id: allPorts
    header: Rectangle {
        id: baseHeader
        width: parent.width
        height: 30

        color: "transparent"
        Text {
            id:captionHeader
            x:10
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("List all serial ports")
        }
    }
    width: parent.width
    height: parent.height
    model: portsList
    delegate: Rectangle {
        id: layout
        width: allPorts.width
        height: 60
        color: "transparent"
        Rectangle {
            anchors.centerIn: parent
            width: allPorts.width - 20
            height: 50
            color: allPorts.currentIndex == index ? "#353637" : "#494d50"
            layer.enabled: allPorts.currentIndex == index ? false : true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#90000000"
                radius: 1
                samples: 3
            }
            Text {
                id: namePort      
                text: portName
                font.pointSize: 14
                color: removed ? "grey" : "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 2
                    color: "#70000000"
                    radius: 2
                    samples: 2
                }
            }
            Rectangle {
                id: portStateText
                width: 40
                height: 10
                radius: 2
                color: statePort ? "green" : "red"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 15
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 1
                    color: "#70000000"
                    radius: 2
                    samples: 2
                }
            }
            MouseArea {
                id: touch
                anchors.fill: parent
                onClicked: {
                    ports.portChanged(namePort.text)
                    allPorts.currentIndex = index
                }
            }
        }
    }
    footer: Text {
        id: footerList
        x:10
        color: "white"
        text: qsTr("Count serial port: " + allPorts.count)
    }
}

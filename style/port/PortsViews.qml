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
            text: qsTr("List connected serial ports")
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
            width: allPorts.width - 10
            height: 50
            color: "#353637"
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#70000000"
                radius: 2
                samples: 2
            }
            Text {
                id: namePort
                text: portName
                font.pointSize: 14
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 1
                    color: "#70000000"
                    radius: 2
                    samples: 2
                }
            }
            Text {
                id: portStateText
                text: removed
                font.pointSize: 14
                color: "white"
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

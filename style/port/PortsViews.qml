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
        height: 45
        color: "transparent"
        Rectangle {
            anchors.centerIn: parent
            width: allPorts.width - 10
            height: 40
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
                font.pointSize: 12
                color: "white"
                anchors.centerIn: parent
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
        text: qsTr("Count serial port: " + allPorts.count)
    }
}

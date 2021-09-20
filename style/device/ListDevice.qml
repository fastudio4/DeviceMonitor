import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtGraphicalEffects 1.0

ListView {
    id: listDevice
    width: selectPort.width
//    model: deviceList
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
            text: qsTr("List device on this serial ports")
        }
    }
    delegate: Rectangle {
        id: layout
        width: listDevice.width
        height: 60
        color: "transparent"
        Rectangle {
            anchors.centerIn: parent
            width: listDevice.width - 20
            height: 50
//            color: listDevice.currentIndex == index ? "#353637" : "#494d50"
//            layer.enabled: listDevice.currentIndex == index ? false : true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#90000000"
                radius: 1
                samples: 3
            }
            Text { //"shortDesc" << "idDevice" << "stateDevice";
                id: nameDev
//                text: shortDesc
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
//                color: stateDevice ? "green" : "red"
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
//                    ports.portChanged(namePort.text)
                    listDevice.currentIndex = index
                }
            }
        }
    }


}

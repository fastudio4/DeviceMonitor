import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

ListView {
    id: settingsPort
    width: cols2.width
    height: cols2.height
    model: portSettings
    delegate: Rectangle {
        id: layoutparams
        width: settingsPort.width
        height: settingsPort.height
        color: "transparent"
        Column {
            id: titleSetting
            width: parent.width
            height: parent.height
            Rectangle {
                id:headerName
                width: titleSetting.width
                height: 40
                color: "transparent"       
                Text {
                    id: name
                    text: qsTr("Selected port is: ") + portName
                    anchors.verticalCenter: parent.verticalCenter
                    x: 15
                    font.pointSize: 12
                    color: "white"
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                    color: "white"
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 1
                        color: "#70000000"
                        radius: 2
                        samples: 2
                    }
                }
            }
            Row{
                id: baseRowSettings
                width: parent.width
                height: parent.height - headerName.height
                Column {
                    width: parent.width/2
                    height: parent.height
                    ItemSeting {
                        ids: "baudRate"
                        nameParameter: qsTr("Baud rate")
                        value: baudRate
                        comboList: portSettings.enums("BaudRate")
                    }
//                    ItemSeting {
//                        nameParameter: qsTr("Data bits")
//                        value: dataBits
//                    }
//                    ItemSeting {
//                        nameParameter: qsTr("Stop bits")
//                        value: stopBits
//                    }
//                    ItemSeting {
//                        nameParameter: qsTr("Parity")
//                        value: parity
//                    }
                }
                Column {
                    width: parent.width/2
                    height: parent.height
                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: "green"
                    }
                }
            }
        }
    }
}

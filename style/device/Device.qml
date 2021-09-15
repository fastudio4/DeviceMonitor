import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtGraphicalEffects 1.0

Page {
    id: devices
    title: "Devices"
    header: Rectangle {
        id: headerDevice
        width: parent.width
        height: 70
        color: "#73d216"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#626296" }
            GradientStop { position: 1.0; color: "#353637" }
        }
        Text {
            id: titleDevice
            color: "white"
            x: 15
            font.pointSize: 18
            text: qsTr("DEVICES CONFIGURATION PAGE")
            anchors.verticalCenter: parent.verticalCenter
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#70000000"
                radius: 2
                samples: 2
            }
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
    Row {
        id: baseLayoutDevice
        width: parent.width
        height: parent.height
        Column {
            id: cols1Device
            width: parent.width/3.5
            height: parent.height
            Rectangle {
                id: layoutListDevice
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#626296" }
                    GradientStop { position: 1.0; color: "#282844" }
                }
                Column {
                    topPadding: 10
                    leftPadding: 10
                    spacing: 10
                    Text {
                        color: "white"
                        wrapMode: "WordWrap"
                        text: qsTr("Select the serial port \n to view connected devices")
                    }
                    ComboBox {
                        id: selectPort
                        width: layoutListDevice.width - 20
                        model: portsList
                        textRole: "portName"
                        font.pointSize: 14
                    }
                }

            }
        }
        Rectangle {
            width: 1
            height: parent.height
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
        Column {
            id: cols2Device
            width: parent.width - cols1Device.width
            height: parent.height
            Rectangle {
                id: layoutSettingsDevice
                width: cols2Device.width
                height: cols2Device.height
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.1; color: "#363654" }
                    GradientStop { position: 1.1; color: "#626296" }
                }
                //                SettingsPortViews {
                //                    id: settingsPort
                //                }
            }
        }
    }
    //    Component.onCompleted: {
    //        ports.portChanged(ports.ports()[0])
    //    }
}



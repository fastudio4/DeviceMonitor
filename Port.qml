import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Page {
    id: port
    title: "Port"
    header: Rectangle {
        id: header
        width: parent.width
        height: 50
        //        color: "#353637"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#6a6a6a" }
            GradientStop { position: 1.0; color: "#353637" }
        }
        Text {
            id: title
            color: "white"
            x: 15
            font.pointSize: 14
            //            font.bold: true
            text: qsTr("SERIAL POPT CONFIGURATION PAGE")
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
        id:baseLayout
        width: parent.width
        height: parent.height
        Column {
            id: cols1
            width: parent.width/3.5
            height: parent.height
            Rectangle {
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#777777" }
                    GradientStop { position: 1.0; color: "#444444" }
                }
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
                                property string nameP: portName
                                text: nameP
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
            }
        }
        Column {
            id: cols2
            width: parent.width - cols1.width
            height: parent.height
            Rectangle {
                id: layoutSettings
                width: cols2.width
                height: cols2.height
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.1; color: "#333333" }
                    GradientStop { position: 1.1; color: "#555555" }
                }
                ListView {
                    id: settingsPort
                    width: cols2.width
                    height: cols2.height
                    model: portSettings
                    delegate: Rectangle {
                        anchors.centerIn: parent
                        width: settingsPort.width
                        height: 50
                        Text {
                            text: stopBits
                        }
                    }
                }
            }
        }
    }
//    Component.onCompleted: {
//        ports.portChanged(ports.ports()[0])
//    }
}

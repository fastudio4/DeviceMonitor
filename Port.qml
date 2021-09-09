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
                    GradientStop { position: 0.0; color: "#315796" }
                    GradientStop { position: 1.0; color: "#0b2756" }
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
//                            color: "#b0afb4"
                            font.pointSize: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("List connected ports")

                        }
                    }
                    width: parent.width
                    height: parent.height
                    model: portList
                    delegate: Rectangle {
                        id: layout
                        width: allPorts.width
                        height: 45
                        color: "transparent"
                        Rectangle {
                            anchors.centerIn: parent
                            width: allPorts.width - 10
                            height: 40
                            radius: 5
//                            border.width: 1
//                            border.color: "#46454a"
                            color: "#353637"
                            Text {
                                id: name
                                text: portName
                                font.pointSize: 12
                                color: "white"
                                anchors.centerIn: parent
//                                font.bold: true
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
                                    console.log(name.text)
                                }
                            }
                        }
                    }
                    footer: Text {
                        x:10
                        text: qsTr("To configure the required port, click on it!")
//                        color: "#b0afb4"
                    }
                }
            }
        }
        Column {
            id: cols2
            width: parent.width - cols1.width
            height: parent.height
            TextField {

            }
        }
    }

}

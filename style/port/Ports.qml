import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Page {
    id: port
    title: "Ports"
    header: Rectangle {
        id: header
        width: parent.width
        height: 70
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#737577" }
            GradientStop { position: 1.0; color: "#353637" }
        }
        Text {
            id: title
            color: "white"
            x: 15
            font.pointSize: 18
            text: qsTr("SERIAL PORTS CONFIGURATION PAGE")
            anchors.verticalCenter: parent.verticalCenter
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 1
                color: "#70000000"
                radius: 2
                samples: 2
            }
        }
        Button {
            text: qsTr("UPDATE LIST")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.margins: 15
            font.pointSize: 14
            onClicked: {
                console.log("NEW")
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
        id: baseLayout
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
                PortsViews {
                    id: allPorts
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
                SettingsPortViews {
                    id: settingsPort
                }
            }
        }
    }
    Component.onCompleted: {
        ports.portChanged(ports.ports()[0])
    }
}

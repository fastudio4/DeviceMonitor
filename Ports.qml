import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4

Page {
    id: ports
    title: qsTr("Ports")
    Row {
        spacing: 10
        Column {
            Row {
                spacing: 10
                Text {
                    text: qsTr("Update COM ports")
                    anchors.verticalCenter: parent.verticalCenter
                }
                Button {
                    text: qsTr("Update")
                }
            }
            ListView {
                id: allComPorts
                width: parent.width/2

            }
        }
        Column {}
    }
}

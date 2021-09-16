import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtGraphicalEffects 1.0

Page {
    width: stackViewDevice.width
    height: stackViewDevice.height
    background: Rectangle {
        color: "transparent"
    }
    Column {
        spacing: 15
        Rectangle {
            id: shortDescLayout
            width: stackViewDevice.width
            height: 50
            color: "transparent"
            Text {
                id:textShortDesc
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Short description")
                font.pointSize: 14
                color: "white"
            }
            TextField {
                id: shortDesc
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textShortDesc.right
                font.pointSize: 14
                anchors.margins: 15
            }
        }
        Rectangle {
            id: idLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textId
                width: textShortDesc.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Device address")
                font.pointSize: 14
                color: "white"
            }
            SpinBox {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textId.right
                font.pointSize: 14
                editable: true
                width: shortDesc.width
                anchors.margins: 15
            }
        }
        Rectangle {
            id: operationLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textOperation
                width: textShortDesc.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Operation device")
                font.pointSize: 14
                color: "white"
            }
            ComboBox {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textOperation.right
                font.pointSize: 14
                width: shortDesc.width
                anchors.margins: 15

                model: ["Read", "Write"]
            }
        }
        Rectangle {
            id: registersLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textRegisters
                width: textShortDesc.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Registers type")
                font.pointSize: 14
                color: "white"
            }
            ComboBox {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textRegisters.right
                width: shortDesc.width
                font.pointSize: 14
                anchors.margins: 15
                model: ["Discrete Inputs","Coils","Input Registers","Holding Registers"]
            }
        }
        Rectangle {
            id: registersAddrCountLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textRegistersAddr
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Start address")
                font.pointSize: 14
                color: "white"
            }
            SpinBox {
                id: registersAddr
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textRegistersAddr.right
                font.pointSize: 14
                editable: true
                anchors.margins: 15
            }
            Text {
                id: textcountRegisters
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: registersAddr.right
                anchors.margins: 15
                text: qsTr("Count reg.")
                font.pointSize: 14
                color: "white"
            }
            SpinBox {
                id: countRegisters
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textcountRegisters.right
                font.pointSize: 14
                editable: true
                anchors.margins: 15
            }
        }
    }
    Button {
        text: qsTr("ADD DEVICE")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15
        font.pointSize: 14
        onClicked: {
            stackViewDevice.pop()
        }
    }
}

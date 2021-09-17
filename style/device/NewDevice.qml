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
            width: stackViewDevice.width
            height: 10
            color: "transparent"
        }
        Rectangle {
            id: shortDescLayout
            width: stackViewDevice.width
            height: 35
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
                id: idDev
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textId.right
                font.pointSize: 14
                editable: true
//                width: shortDesc.width
                anchors.margins: 15
            }
            Text {
                id:textOperation
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: idDev.right
                anchors.margins: 15
                text: qsTr("Operation")
                font.pointSize: 14
                color: "white"
            }

            ComboBox {
                id:operationCombo
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textOperation.right
                font.pointSize: 14
                width: 130
                anchors.margins: 15

                model: ["Read", "Write"]
            }
        }
        Rectangle {
            id: registersAddrCountLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textRegistersAddr
                width: textShortDesc.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Start register")
                font.pointSize: 14
                color: "white"
            }
            SpinBox {
                id: registersAddr
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textRegistersAddr.right
                font.pointSize: 14
                editable: true
                width: 130
                anchors.margins: 15
            }
            Text {
                id: textcountRegisters
//                width: textOperation.width
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
                width: 130
                anchors.margins: 15
            }
        }
        Rectangle {
            id: portConnectedLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id:textPortConnected
                width: textShortDesc.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("Connect to port")
                font.pointSize: 14
                color: "white"
            }
            ComboBox {
                id: portConnected
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textPortConnected.right
                width: shortDesc.width
                font.pointSize: 14
                anchors.margins: 15
                model: portsList
                textRole: "portName"
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
                id:registersType
                anchors.verticalCenter: parent.verticalCenter
                anchors.left:  textRegisters.right
                width: shortDesc.width
                font.pointSize: 14
                anchors.margins: 15
                model: ["Discrete Inputs","Coils","Input Registers","Holding Registers"]
            }
        }
        Rectangle {
            id: stateDeviceLayout
            width: stackViewDevice.width
            height: 35
            color: "transparent"
            Text {
                id: textStateDevice
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 15
                text: qsTr("State device")
                font.pointSize: 14
                color: "white"
            }
            Switch {
                id:stateDeviceSwitch
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: textStateDevice.right
                anchors.margins: 30
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
//            stackViewDevice.pop()
//            shortDesc.text
//            idDev.value
//            operationCombo.currentIndex
//            registersAddr.value
//            countRegisters.value
//            portConnected.currentText
//            registersType.currentIndex
//            stateDeviceSwitch.position
            console.log()
        }
    }
}

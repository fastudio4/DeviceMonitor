import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

ListView {
    id: settingsPort
    width: cols2.width
    height: cols2.height
    model: portSettings
    signal updateListPort()
    delegate: Rectangle {
        id: layoutparams
        width: settingsPort.width
        height: settingsPort.height
        color: "transparent"
        Column {
            //            spacing: 5
            id: titleSetting
            width: parent.width
            height: parent.height
            Rectangle {
                id:headerName
                width: titleSetting.width
                height: 60
                color: "transparent"
                Text {
                    id: name
                    text: qsTr("Selected port is: ") + portName
                    anchors.verticalCenter: parent.verticalCenter
                    x: 15
                    font.pointSize: 14
                    color: "white"
                }
            }
            Row{
                id: baseRowSettings
                width: parent.width
                height: parent.height - headerName.height
                Column {
                    width: parent.width/2
                    height: parent.height
                    spacing: 10
                    ItemSeting {
                        ids: "baudRate"
                        nameParameter: qsTr("Baud rate")
                        value: baudRate
                        comboList: portSettings.enums("BaudRate")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemSeting {
                        ids: "dataBits"
                        nameParameter: qsTr("Data bits")
                        value: dataBits
                        comboList: portSettings.enums("DataBits")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemSeting {
                        ids: "stopBits"
                        nameParameter: qsTr("Stop bits")
                        value: stopBits
                        comboList: portSettings.enums("StopBits")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemSeting {
                        ids: "parity"
                        nameParameter: qsTr("Parity")
                        value: parity
                        comboList: portSettings.enums("Parity")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemSeting {
                        ids: "flowControl"
                        nameParameter: qsTr("Flow Control")
                        value: flowControl
                        comboList: portSettings.enums("FlowControl")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                }
                Column {
                    width: parent.width/2
                    height: parent.height
                    spacing: 10
                    ItemSeting {
                        ids: "timeout"
                        nameParameter: qsTr("Timeout")
                        value: timeout
                        comboList: portSettings.enums("Timeout")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemSeting {
                        ids: "retries"
                        nameParameter: qsTr("Retries")
                        value: retries
                        comboList: portSettings.enums("Retries")
                        onDataChange:{
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, valueSelect)
                        }
                    }
                    ItemState {
                        ids: "statePort"
                        nameParameter: qsTr("State port")
                        value: statePort
                        onDataState: {
                            var q_model_index = portSettings.index(index, 0);
                            portSettings.setData(q_model_index, value)
                            allPorts.update()
                        }
                    }
                }
            }
        }
    }
}

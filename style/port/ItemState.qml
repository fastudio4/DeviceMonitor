import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Controls.Styles 2.12

Rectangle {
    property string ids
    property string nameParameter
    property bool value
    function curentStatePort() {
        stateSwitch.checked = value
    }
    signal dataState (string value)
    width: parent.width
    height: 40
    color: "transparent"
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        text: nameParameter
        anchors.margins: 15
        font.pointSize: 14
        color: "white"
    }
    Switch {
        id:stateSwitch
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: 15
        checked: value
//        style: SwitchStyle {
//            groove: Rectangle {
//                implicitWidth: 100
//                implicitHeight: 20
//                radius: 9
//                border.color: control.activeFocus ? "darkblue" : "gray"
//                border.width: 1
//            }
//        }
        onCheckedChanged: {
            dataState(ids + "|" + position.toString())
        }
    }
    Component.onCompleted: {
        curentStatePort()
    }
}

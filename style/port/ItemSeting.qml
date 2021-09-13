import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Rectangle {
    property string ids
    property string nameParameter
    property string value
    property var comboList
    function curentIndexCombo() {
        listParams.currentIndex = listParams.find(value)
    }
    signal dataChange (string valueSelect)
    width: parent.width
    height: 40
    color: "transparent"
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        text: nameParameter
        anchors.margins: 15
        font.pointSize: 12
        color: "white"
    }
    ComboBox {
        id:listParams
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: 15
        font.pointSize: 12
        model: comboList
    }
    Component.onCompleted: {
        curentIndexCombo()
    }
}

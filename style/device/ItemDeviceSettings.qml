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
    Button {
        text: "text1"
        anchors.centerIn: parent
        onClicked: {
            stackViewDevice.push(newDevice)
        }
    }
}

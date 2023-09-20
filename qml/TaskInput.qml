import QtQuick 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0


Rectangle {
    property alias text: textField.text
    signal taskAdded(string task)
    width: parent.width
    height: 80
    color: "transparent"

    TextField {
        id: textField
        font.family: AppUtil.font1.name
        font.pixelSize: 16

        height: 40
        background: Rectangle {
            color: "white"
            radius: 5
        }
        anchors { 
            left: parent.left; 
            right: button.left; 
            verticalCenter: parent.verticalCenter;
            leftMargin: 10; 
            rightMargin: 10
        }
    }

    Button {
        id: button
        width: 50
        font.pixelSize: 20
        anchors { 
            right: parent.right; 
            verticalCenter: parent.verticalCenter; 
            rightMargin: 10
        }
        text: "➕"
        onClicked: taskAdded(textField.text)
    }
}

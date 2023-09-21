import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property alias text: textField.text
    signal taskAdded(string task)

    width: parent.width
    height: 60
    color: "#F5F5F5"
    border.color: "#E0E0E0"
    border.width: 1
    radius: 5

    Row {
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10 

        TextField {
            id: textField
            placeholderText: "Add a task"
            font.pixelSize: 18
            width: parent.width - button.width - 10
            height: parent.height
            background: Rectangle {
                color: "transparent"
                border.color: "#E0E0E0"
                border.width: 1
                radius: 5
            }
        }

        Button {
            id: button
            text: "Add"
            font.pixelSize: 18
            width: 80
            height: parent.height
            background: Rectangle {
                color: "#2196F3"
                radius: 5
            }
            onClicked: taskAdded(textField.text)
        }
    }
}

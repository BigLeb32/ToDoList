import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: parent.width
    height: 50
    color: "white"
    radius: 15
    border.color: "grey"
    border.width: 1
    
    property alias taskText: taskText.text
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
    
    states: [
        State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges { target: root; border.color: "lightblack" }
        }
    ]
    
    transitions: [
        Transition {
            from: ""; to: "hovered"
            reversible: true
            ColorAnimation { duration: 200 }
        }
    ]
    
    
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        
        CheckBoxStyle1 {
            id: checkbox
            text: ""
        }
        
        
        Text {
            id: taskText
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            font.family: AppUtil.font1.name
            font.bold: false
            
            font.pixelSize: 16
            color: "#212121"
            text: model.task
        }
    }
    
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "."



ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "To Do List"

    background: Rectangle {
        color: "lightgrey"
    }
    
    ListView {
        id: listView
        anchors { top: parent.top; bottom: taskInput.top; horizontalCenter: parent.horizontalCenter }
        width: parent.width - 20
        model: taskModel
        spacing: 10
        topMargin: 10
        delegate: Task {}
    }
    
    TaskInput {
        id: taskInput
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        
        onTaskAdded: taskModel.addTask(taskInput.text)
    }
    
    Component.onCompleted: {
//        taskModel.addTask("Task 1")
//        taskModel.addTask("Task 2")
//        taskModel.addTask("Make a grocery list")
    }
}

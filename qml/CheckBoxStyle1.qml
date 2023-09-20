import QtQuick 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0

CheckBox {
    id: control
    text: "CheckBox"
    font.family: AppUtil.font1.name
    font.pixelSize: 16
    checked: false
    
    property color indicatorColor: "darkgrey"
    property real indicatorRadius: control.height/2
    property color indicatorImageColor: "white"
    property string indicatorImageSource: "qrc:/assets/checkmark_white.png"
    property bool fillBackground: true
    
    indicator:  Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        x: control.leftPadding
        y: parent.height / 2 - height / 2 
        radius: indicatorRadius
        border.color: "#646464"
        color: fillBackground ? (control.checked ? indicatorColor : "white") : "white"
        
        ColoredImage {
            anchors.fill: parent
            anchors.margins: 4
            source: indicatorImageSource
            visible: control.checked
            color: indicatorImageColor
        }
    }
    
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color:  control.down ? "#646464" : "#323232"
        verticalAlignment: Text.AlignVCenter
        leftPadding: indicator.width + 5
    }
}

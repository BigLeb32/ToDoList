import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Item {
    
    property alias img: image
    property alias source: image.source
    property alias color: overlay.color
    
    Image {
        id: image
        anchors.fill: parent 
        smooth: true
        visible: false
    }
    
    ColorOverlay {
        id: overlay
        anchors.fill: image
        source: image
        color: "blue"
        
    }
    
    
}

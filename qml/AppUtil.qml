pragma Singleton

import QtQuick 2.15

QtObject {

    // defines app font
    property QtObject font1: FontLoader {
        id: font1
        source: "qrc:/assets/Nunito-Regular.ttf"
    }    
    
} 
  

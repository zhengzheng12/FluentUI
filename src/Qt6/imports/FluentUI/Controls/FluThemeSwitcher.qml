import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

Row {
    property bool showIcon: true
    property bool showText: true
    property string lightText: qsTr("Light")
    property string darkText: qsTr("Dark")
    property int iconSize: 16
    property int spacing: 6
    property color iconColor: {
        if(FluTheme.dark){
            if(!enabled){
                return Qt.rgba(130/255,130/255,130/255,1)
            }
            return Qt.rgba(1,1,1,1)
        }else{
            if(!enabled){
                return Qt.rgba(161/255,161/255,161/255,1)
            }
            return Qt.rgba(0,0,0,1)
        }
    }
    property color textColor: {
        if(FluTheme.dark){
            if(!enabled){
                return Qt.rgba(130/255,130/255,130/255,1)
            }
            return Qt.rgba(1,1,1,1)
        }else{
            if(!enabled){
                return Qt.rgba(161/255,161/255,161/255,1)
            }
            return Qt.rgba(0,0,0,1)
        }
    }
    property alias hoverEnabled: mouseArea.hoverEnabled
    property alias containsMouse: mouseArea.containsMouse
    property alias pressed: mouseArea.pressed
    
    signal clicked()
    
    id: control
    spacing: control.spacing
    enabled: true
    
    Accessible.role: Accessible.Button
    Accessible.name: FluTheme.dark ? lightText : darkText
    Accessible.description: qsTr("Switch between light and dark theme")
    Accessible.onPressAction: control.clicked()
    
    FluIcon {
        id: icon
        visible: showIcon
        anchors.verticalCenter: parent.verticalCenter
        iconSource: FluTheme.dark ? FluentIcons.Brightness : FluentIcons.QuietHours
        iconSize: control.iconSize
        iconColor: control.iconColor
        opacity: mouseArea.pressed ? 0.7 : (mouseArea.containsMouse ? 0.9 : 1.0)
        
        Behavior on opacity {
            NumberAnimation {
                duration: FluTheme.animationEnabled ? 83 : 0
                easing.type: Easing.OutQuad
            }
        }
    }
    
    FluText {
        id: text
        visible: showText
        anchors.verticalCenter: parent.verticalCenter
        text: FluTheme.dark ? lightText : darkText
        color: control.textColor
        opacity: mouseArea.pressed ? 0.7 : (mouseArea.containsMouse ? 0.9 : 1.0)
        
        Behavior on opacity {
            NumberAnimation {
                duration: FluTheme.animationEnabled ? 83 : 0
                easing.type: Easing.OutQuad
            }
        }
    }
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            control.clicked()
            // Switch theme mode
            if(FluTheme.dark){
                FluTheme.darkMode = FluThemeType.Light
            }else{
                FluTheme.darkMode = FluThemeType.Dark
            }
        }
    }
    
    // Smooth transition animation for icon and text changes
    Behavior on opacity {
        NumberAnimation {
            duration: FluTheme.animationEnabled ? 167 : 0
            easing.type: Easing.OutCubic
        }
    }
}
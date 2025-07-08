import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluIconButton {
    property bool showText: false
    property string lightText: qsTr("Light")
    property string darkText: qsTr("Dark")
    property string lightToolTip: qsTr("Switch to light mode")
    property string darkToolTip: qsTr("Switch to dark mode")
    
    id: control
    iconSource: FluTheme.dark ? FluentIcons.Brightness : FluentIcons.QuietHours
    text: showText ? (FluTheme.dark ? lightText : darkText) : ""
    display: showText ? Button.TextBesideIcon : Button.IconOnly
    
    Accessible.name: FluTheme.dark ? lightText : darkText
    Accessible.description: FluTheme.dark ? lightToolTip : darkToolTip
    
    FluTooltip {
        visible: !showText && control.hovered
        text: FluTheme.dark ? lightToolTip : darkToolTip
        delay: 500
    }
    
    onClicked: {
        if(FluTheme.dark){
            FluTheme.darkMode = FluThemeType.Light
        }else{
            FluTheme.darkMode = FluThemeType.Dark
        }
    }
    
    // Smooth transition for icon changes
    Behavior on iconSource {
        SequentialAnimation {
            NumberAnimation {
                target: control
                property: "opacity"
                to: 0.5
                duration: FluTheme.animationEnabled ? 83 : 0
                easing.type: Easing.OutQuad
            }
            NumberAnimation {
                target: control
                property: "opacity" 
                to: 1.0
                duration: FluTheme.animationEnabled ? 83 : 0
                easing.type: Easing.OutQuad
            }
        }
    }
}
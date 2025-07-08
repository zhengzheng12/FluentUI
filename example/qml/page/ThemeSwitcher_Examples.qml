// FluentUI Theme Switcher - Usage Examples
// Copy and paste these examples into your QML files

import QtQuick 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

// Example 1: Basic theme switcher in a header
RowLayout {
    FluText {
        text: "Theme:"
    }
    FluThemeSwitcher {
        // Default settings - shows both icon and text
    }
}

// Example 2: Compact toolbar with icon-only switcher
RowLayout {
    FluIconButton {
        iconSource: FluentIcons.Settings
    }
    FluThemeSwitcherButton {
        // Icon only with tooltip
    }
    FluIconButton {
        iconSource: FluentIcons.Help
    }
}

// Example 3: Settings page with detailed switcher
FluFrame {
    padding: 10
    ColumnLayout {
        FluText {
            text: qsTr("Appearance")
            font: FluTextStyle.Subtitle
        }
        RowLayout {
            FluText {
                text: qsTr("Theme:")
            }
            FluThemeSwitcherButton {
                showText: true
                lightText: qsTr("Light Theme")
                darkText: qsTr("Dark Theme")
            }
        }
    }
}

// Example 4: Navigation bar integration
RowLayout {
    spacing: 20
    
    FluText {
        text: "FluentUI App"
        font: FluTextStyle.Title
    }
    
    Item { Layout.fillWidth: true } // Spacer
    
    FluThemeSwitcher {
        iconSize: 20
        spacing: 8
    }
}

// Example 5: Custom styled switcher for branding
FluThemeSwitcher {
    iconSize: 24
    spacing: 10
    lightText: "☀️ Light Mode"
    darkText: "🌙 Dark Mode"
    
    // Custom click handler if needed
    onClicked: {
        console.log("Theme switched!")
        // Additional custom logic here
    }
}

// Example 6: Card with theme controls
FluFrame {
    ColumnLayout {
        FluText {
            text: qsTr("Display Preferences")
            font: FluTextStyle.BodyStrong
        }
        
        Row {
            spacing: 10
            FluText {
                text: qsTr("Color scheme:")
                anchors.verticalCenter: parent.verticalCenter
            }
            FluThemeSwitcher {
                showIcon: true
                showText: true
            }
        }
        
        FluText {
            text: qsTr("Choose your preferred color scheme")
            color: FluTheme.fontSecondaryColor
            font: FluTextStyle.Caption
        }
    }
}

// Example 7: Responsive switcher (adapts to available space)
RowLayout {
    FluThemeSwitcher {
        showText: parent.width > 200  // Hide text on narrow displays
        iconSize: parent.width > 300 ? 20 : 16
    }
}
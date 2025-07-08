import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0
import "../component"

FluScrollablePage{

    title: qsTr("Theme Switcher")

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 120
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors.fill: parent

            FluText{
                text: qsTr("Basic Theme Switcher")
                font: FluTextStyle.Subtitle
            }

            Row{
                spacing: 20
                FluThemeSwitcher{
                    id: basic_switcher
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Icon + Text switcher")
                    color: FluTheme.fontSecondaryColor
                }
            }

            Row{
                spacing: 20
                FluThemeSwitcher{
                    showText: false
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Icon only switcher")
                    color: FluTheme.fontSecondaryColor
                }
            }
        }
    }

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 120
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors.fill: parent

            FluText{
                text: qsTr("Button Style Theme Switcher")
                font: FluTextStyle.Subtitle
            }

            Row{
                spacing: 20
                FluThemeSwitcherButton{
                    id: button_switcher
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Icon button switcher (with tooltip)")
                    color: FluTheme.fontSecondaryColor
                }
            }

            Row{
                spacing: 20
                FluThemeSwitcherButton{
                    showText: true
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Icon + Text button switcher")
                    color: FluTheme.fontSecondaryColor
                }
            }
        }
    }

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 160
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors.fill: parent

            FluText{
                text: qsTr("Custom Styled Switcher")
                font: FluTextStyle.Subtitle
            }

            Row{
                spacing: 20
                FluThemeSwitcher{
                    iconSize: 24
                    lightText: qsTr("☀️ Light")
                    darkText: qsTr("🌙 Dark")
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Large icons with custom text")
                    color: FluTheme.fontSecondaryColor
                }
            }

            Row{
                spacing: 20
                FluThemeSwitcher{
                    iconSize: 14
                    spacing: 4
                    lightText: qsTr("Light Mode")
                    darkText: qsTr("Dark Mode")
                }
                FluText{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Compact style with detailed text")
                    color: FluTheme.fontSecondaryColor
                }
            }
        }
    }

    FluFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 120
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors.fill: parent

            FluText{
                text: qsTr("Current Theme Information")
                font: FluTextStyle.Subtitle
            }

            Grid{
                columns: 2
                columnSpacing: 20
                rowSpacing: 8

                FluText{
                    text: qsTr("Current mode:")
                    color: FluTheme.fontSecondaryColor
                }
                FluText{
                    text: {
                        if(FluTheme.darkMode === FluThemeType.Dark) return qsTr("Dark")
                        if(FluTheme.darkMode === FluThemeType.Light) return qsTr("Light")
                        return qsTr("System")
                    }
                    color: FluTheme.fontPrimaryColor
                }

                FluText{
                    text: qsTr("Is dark:")
                    color: FluTheme.fontSecondaryColor
                }
                FluText{
                    text: FluTheme.dark ? qsTr("Yes") : qsTr("No")
                    color: FluTheme.fontPrimaryColor
                }
            }
        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'// Basic usage
FluThemeSwitcher {
    // Shows icon and text by default
}

// Icon only
FluThemeSwitcher {
    showText: false
}

// Button style with tooltip
FluThemeSwitcherButton {
    showText: false  // Icon only with tooltip
}

// Button style with text
FluThemeSwitcherButton {
    showText: true
}

// Custom styling
FluThemeSwitcher {
    iconSize: 24
    lightText: "☀️ Light"
    darkText: "🌙 Dark"
    spacing: 8
}'
    }
}
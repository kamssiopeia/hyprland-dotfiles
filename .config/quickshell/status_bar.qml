import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true

    margins.top: 5
    margins.left: 5
    margins.right: 5

    implicitHeight: 30
    color: 'transparent'

    readonly property string backgroundColor: Qt.alpha("#0e0f16", 0.8)
    readonly property string foregroundColor: "#c2c3c4"

    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 15
    
    Rectangle {
        anchors.fill: parent
        radius: 10
        color: backgroundColor
    }

    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        spacing: 8

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1

            IconImage {
                property string activeWindow: Hyprland.activeToplevel?.wayland?.appId ?? ""
                property bool isActive: Hyprland.activeToplevel?.wayland?.activated ?? false

                source: Quickshell.iconPath(activeWindow, true)
                width: 20
                height: 20
                visible: status === Image.Ready && isActive
            }

            Text {
                property string activeWindow: Hyprland.activeToplevel?.wayland?.appId ?? ""
                property bool isActive: Hyprland.activeToplevel?.wayland?.activated ?? false

                text: activeWindow
                color: foregroundColor
                font {
                    family: fontFamily
                    pixelSize: fontSize
                }
                visible: isActive
            }

            Item { Layout.fillWidth: true }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            spacing: 10

            Repeater {
                model: Hyprland.workspaces

                Text {
                    text: modelData.focused ? '󰮯' : '󰊠'
                    color: modelData.focused ? foregroundColor : Qt.alpha(foregroundColor, 0.6)

                    font {
                        family: fontFamily
                        pixelSize: fontSize
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1

            Item { Layout.fillWidth: true }

            Text {
                id: clock
                color: foregroundColor

                font {
                    family: fontFamily
                    pixelSize: fontSize
                }

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: clock.text = Qt.formatDateTime(new Date(), "dd.MM HH:mm")
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: openCalendar.running = true
                }

                Process {
                    id: openCalendar
                    command: ["sh", "-c", "~/.config/hypr/scripts/google_calendar_webapp.sh"]
                }
            }
        }
    }
}
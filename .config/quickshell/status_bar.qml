import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

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
                        family: root.fontFamily
                        pixelSize: root.fontSize
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
        }
    }
}
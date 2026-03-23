import Quickshell
import QtQuick

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
    
    Rectangle {
        anchors.fill: parent
        radius: 10
        color: backgroundColor
    }
}
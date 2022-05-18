import subdir.test

import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "#ccffcc"

        Column {
            anchors.centerIn: parent
            Label {
                text: "This is from main.qml"
            }

            SubItem {}
        }
    }
}

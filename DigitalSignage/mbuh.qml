import QtQuick 2.1
import QtQuick.Window 2.1

Window
{
    id: window1
    visible: true
    width:432
    height:768

    Flickable {
        id: flickable1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.HorizontalFlick

        Rectangle {
            id: rectangle1
            x: 13
            y: 12
            width: 200
            height: 200
            color: "#da6767"
        }

        Rectangle {
            id: rectangle2
            x: 245
            y: 12
            width: 200
            height: 200
            color: "#4a0808"
        }
    }




}

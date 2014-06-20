import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as Skel

Window
{
    id: wdw
    visible: true
    width:500
    height:500
    Rectangle {
        id: containing_rect
        property string text
        color:"red"
        width:300
        height:200

        Text {
            id: text_field
            anchors.top: parent.top
            anchors.left: parent.left

            width: 5
            text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
            wrapMode: Text.WordWrap


        }

    }



}

import QtQuick 2.1
import QtQuick.Window 2.1

Window
{
    visible: true
    width:500
    height:500
    color:"yellow"


    Rectangle
    {

        width: 163
        height: 130
        color:"blue"

        //Drag.target: parent

        //Drag:parent
        ////        Text
        ////        {
        ////            text:"Johhhnn"
        ////            font: argh.name
        ////        }

        ////        FontLoader{
        ////            id:argh
        ////            source: "Aaargh.ttf"
        ////        }


        MouseArea
        {
            anchors.fill: parent
            drag.target: parent

        }
    }



}

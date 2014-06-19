import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as Skel

Window
{
    id: wdw
    visible: true
    width:500
    height:500
    color:"red"

    Rectangle
    {
        id: erect
        x:Skel.scaleX(wdw,10)
        y:Skel.scaleY(wdw,10)

        width: 163
        height: 130
        color:"green"

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

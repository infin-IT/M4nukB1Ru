import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as Skel

Window
{
    id: wdw
    visible: true
    width:500
    height:500
<<<<<<< HEAD
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
=======
    color:"black"

    Image
    {
        z:-1
        anchors.fill: parent
        source: "http://192.168.1.123/images/landscape.jpg"
    }

    DigitalClock
    {
>>>>>>> e40ff237ce6d62c20ff38e6caaf371b4be916ece

    }


}

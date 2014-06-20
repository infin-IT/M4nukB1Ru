import QtQuick 2.0
import "Scaling.js" as Scales
import "Positioning.js" as Pos
Rectangle
{
    property int space: 100
    id: containerMaster
    anchors.fill:parent
    color:"transparent"

    /*
        Layout:

        [Digital Clock] 0
         __________________
        |                  | 1
        |    News Feed     |
        |__________________|
         ______  __________
      2 |      || Timeline | 3
        | MAP  ||          |
        |______||          |
         ______ |          |
      4 |      ||__________|
        |SIASAT| __________
        |______|| About    | 5
                |__________|
    */

    //CONTAINER 0
    Rectangle
    {
        id:container0
        x:0
        y:0
        width: parent.width
        height: Scales.scaleY(containerMaster,20)
        color:"transparent"
        DigitalClock
        {

        }
    }

    Rectangle
    {
        id:container1
        y:Pos.bottomOf(container0,0)
        width: Scales.scaleX(parent,30)
        height: width
        color:"green"
        border.color: "black"
        opacity: 0.5
    }

}


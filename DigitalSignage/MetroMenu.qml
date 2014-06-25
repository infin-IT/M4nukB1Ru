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

     [Digital Clock]+[Weather]
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
        |______||    CC    | 5
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

        //CONTAINER DIGITAL CLOCK
        Rectangle
        {
            id:containerDC
            x:0
            y:0
            width:Scales.scaleX(parent,70)
            height: parent.height
            color:"transparent"
            DigitalClock{}
        }

        //CONTAINER WEATHER
        Rectangle
        {
            id:containerW
            width:Scales.scaleX(parent,30)
            height: parent.height
            x:Pos.rightOf(containerDC,0)
            y:0
            color:"transparent"
            Weather{}
        }

    }

    //CONTAINER 1
    Rectangle
    {
        id:container1
        y:Pos.bottomOf(container0,0)
        anchors.left:parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        height: Scales.scaleY(parent,20)
        color:"Red"
        border.color: "black"
        opacity: 0.5

        Text
        {
            anchors.centerIn: parent
            text:"Timeline"
            font.pixelSize:50
            color:"black"
        }

        MouseArea
        {
            anchors.fill:parent
            onClicked:
            {
                load1.source= "Timeline.qml"
            }
        }
    }

    //CONTAINER 2
    Rectangle
    {
        id:container2
        y:Pos.bottomOf(container1,10)
        width: Scales.scaleX(parent,50)-10
        height: width
        color:"green"
        border.color: "black"
        opacity: 0.5

        Text
        {
            anchors.centerIn: parent
            text:"Map"
            font.pixelSize: 50
            color:"black"
        }

        MouseArea
        {
            anchors.fill:parent
            onClicked:
            {
                load1.source= "Timeline.qml"
            }
        }
    }

    //CONTAINER 3
    Rectangle
    {
        id:container3
        y:Pos.bottomOf(container1,10)
        x:Pos.rightOf(container2,10)
        width: Scales.scaleX(parent,50)
        height: Scales.scaleY(parent,33)-10
        color:"Blue"
        border.color: "black"
        opacity: 0.5

        Text
        {
            anchors.centerIn: parent
            text:"News Feed"
            font.pixelSize: 50
            color:"black"
        }

        MouseArea
        {
            anchors.fill:parent
            onClicked:
            {
                load1.source= "Timeline.qml"
            }
        }
    }

    //CONTAINER 4
    Rectangle
    {
        id:container4
        y:Pos.bottomOf(container2,10)
        width: Scales.scaleX(parent,50)-10
        height: width
        color:"Yellow"
        border.color: "black"
        opacity: 0.5

        Text
        {
            anchors.centerIn: parent
            text:"SIASAT"
            font.pixelSize: 50
            color:"black"
        }

        MouseArea
        {
            anchors.fill:parent
            onClicked:
            {
                load1.source= "Timeline.qml"
            }
        }
    }

    //CONTAINER 5
    Rectangle
    {
        id:container5
        y:Pos.bottomOf(container3,10)
        x:Pos.rightOf(container2,10)
        width: Scales.scaleX(parent,50)
        height: Scales.scaleY(parent,25)
        color:"Black"
        border.color: "black"
        opacity: 0.5

        Text
        {
            anchors.centerIn: parent
            text:"Campus Care"
            font.pixelSize: 50
            color:"black"
        }

        MouseArea
        {
            anchors.fill:parent
            onClicked:
            {
                load1.source= "Timeline.qml"
            }
        }
    }

    Loader
    {
        id:load1
        anchors.fill:parent
    }
}


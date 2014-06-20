import QtQuick 2.0


Flickable
{
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
    clip : true
    contentWidth: parent.width

    Rectangle
    {
        id:abang
        color:"red"
        x:0
        width:100
        height:100
    }

    Rectangle
    {
        id:biru
        color:"blue"
        x:abang.width
        width:200
        height:100
    }

    Rectangle
    {
        id:ijo
        color:"green"
        x:abang.width+biru.width
        width:300
        height:100
    }

    Rectangle
    {
        id:kuning
        color:"yellow"
        x:abang.width+biru.width+ijo.width
        width:300
        height:parent.height
    }

    Rectangle
    {
        id:ireng
        color:"black"
        x:abang.width+biru.width+ijo.width+kuning.width
        width:300
        height:parent.height
    }
}


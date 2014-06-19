import QtQuick 2.0

Rectangle
{

    FontLoader
    {
        id:argh
        source: "Aaargh.ttf"
    }

    Text
    {
        text: "John"
        color:"white"
        font: argh.name

    }

    width: 130
    height: 130
    color:"blue"
    border.color: "black"
    opacity: 0.5
    MouseArea
    {
        anchors.fill: parent
        drag.target: parent


    }
}


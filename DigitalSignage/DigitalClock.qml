import QtQuick 2.0

Rectangle
{
    width: 200
    height: 200
    color:"blue"
    Drag:parent
    Text
    {
        text:"Johhhnn"
        font: argh.name
    }

    FontLoader{
        id:argh
        source: "Aaargh.ttf"
    }
}


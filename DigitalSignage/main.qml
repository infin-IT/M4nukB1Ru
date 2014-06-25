import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as Scales

Window
{
    id: wdw
    visible: true
    width:432
    height:768

    color:"black"

    Loader
    {
        id:load1
        width: parent.width
        height: parent.height
        source: "MainMenu.qml"
    }

    Loader
    {
        id:load2
        width: parent.width
        height: parent.height
    }
}



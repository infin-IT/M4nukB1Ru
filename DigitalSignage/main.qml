import QtQuick 2.1
import QtQuick.Window 2.1

Window
{
    visible: true
    width:500
    height:500
    color:"black"

    Image
    {
        z:-1
        anchors.fill: parent
        source: "http://192.168.1.123/images/landscape.jpg"
    }

    DigitalClock
    {

    }


}

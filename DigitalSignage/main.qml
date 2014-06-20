import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as Scales

Window
{
    id: wdw
    visible: true
    property variant imagePath: ["landscape.jpg","landscape2.jpg","landscape3.jpg","landscape4.jpg"]
    property int ctrBackground: 1
    width:432
    height:768

    color:"black"


    /*
        Background Image :
        bkgImage1 - Transition Image Temporary 1
        bkgImage2 - Transition Image Temporary 2
    */
        Image
        {
            id:bkgImage1
            height: parent.height
            width: bkgImage1.sourceSize.width * parent.height/bkgImage1.sourceSize.height
            anchors.horizontalCenter: parent.horizontalCenter
            x:0
            source: imagePath[0]

            NumberAnimation on opacity
            {
                id: image1in
                from: 0
                to: 1
                duration: 1000
            }

            NumberAnimation on opacity
            {
                id: image1out
                from:1
                to: 0
                duration: 1000
            }
        }

        Image {
            id: bkgImage2
            height: parent.height
            width: bkgImage1.sourceSize.width * parent.height/bkgImage1.sourceSize.height
            anchors.horizontalCenter: parent.horizontalCenter
            x:0
            source: imagePath[1]

            NumberAnimation on opacity
            {
                id: image2in
                from: 0
                to: 1
                duration: 1000
            }

            NumberAnimation on opacity
            {
                id: image2out
                from:1
                to: 0
                duration: 1000
            }

        }



      /*
        Rectangle Container
        for
        Metro Menu
      */
        Rectangle {
            id: rectangle1
            color: "transparent"
            anchors.right: parent.right
            anchors.rightMargin: Scales.scaleX(wdw,5)
            anchors.left: parent.left
            anchors.leftMargin: Scales.scaleX(wdw,5)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Scales.scaleX(wdw,5)
            anchors.top: parent.top
            anchors.topMargin: Scales.scaleX(wdw,5)
            MetroMenu
            {

            }

        }

        /*
        Background Image Transition Timer

        WARNING: Not supported in QT Design
    */
        Timer
        {
            interval: 10000
            repeat: true
            running: true
            onTriggered:
            {
                ctrBackground++
                console.debug(ctrBackground)
                if (ctrBackground>imagePath.length-1) ctrBackground=0
                if (bkgImage1.opacity===1 && bkgImage2.opacity===1)
                {
                    image1out.start()
                }
                if (bkgImage2.opacity===1) //gbr2 didepan
                {
                    image1in.start()
                    image2out.start()
                    bkgImage1.source=imagePath[ctrBackground]
                }
                else
                {
                    image1out.start()
                    image2in.start()
                    bkgImage2.source=imagePath[ctrBackground]
                }
            }
        }

}



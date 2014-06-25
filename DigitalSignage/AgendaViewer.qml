import QtQuick 2.0
import QtWebKit 3.0
import "Scaling.js" as S

Rectangle {
    id:aV
    anchors.fill: parent
    color:"transparent"
    signal isClosed()
    signal isFadeOut()
    property string webAddress
    opacity: 0

    Rectangle
    {
        anchors.fill:parent
        color:"black"
        opacity:0.5
    }

    Rectangle
    {
        id: rectangle1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:(9/16)*height+100
        height: parent.height/1.3
        color:"transparent"
        Image {
            id: im1
            source: "timelineWindow.png"
            anchors.fill: parent
        }
        WebView
        {
            url:webAddress
            anchors.bottom: parent.bottom
            anchors.bottomMargin: S.scaleY(parent,2)
            anchors.top: parent.top
            anchors.topMargin: S.scaleY(parent,7)
            anchors.right: parent.right
            anchors.rightMargin: S.scaleX(parent,7)
            anchors.left: parent.left
            anchors.leftMargin: S.scaleX(parent,3)

            //scale:1

            smooth: true
            //anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Rectangle
    {
        x:S.scaleX(parent,90)
        y:S.scaleY(parent,12)
        width:S.scaleY(parent,5)
        height:S.scaleY(parent,5)
        color:"transparent"
        MouseArea
        {

            anchors.fill:parent

            onClicked:
            {
                isClosed();
            }
        }
    }
    Behavior on opacity {
        NumberAnimation {
            id:anim
            duration: 400;
            easing.type:
                Easing.InQuad
            onRunningChanged:
            {
                if(!anim.running&&!opacity)
                {
                    isFadeOut()
                }
            }
        }
    }


}

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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:(9/16)*height+100
        height: parent.height/1.3
        color:"transparent"
        Image {
            id: im1
            source: "http://192.168.1.123/images/timelineWindow.png"
            anchors.fill: parent
        }
        WebView
        {
            url:webAddress
            height: parent.height-S.scaleY(parent,20);
            width: parent.width-S.scaleX(parent,15)

            //scale:1
            smooth: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

    }

    MouseArea
    {
        anchors.fill:parent
        onClicked:
        {
            isClosed();
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

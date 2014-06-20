import QtQuick 2.1
import QtQuick.Window 2.1
import "Scaling.js" as S
import QtQuick.XmlListModel 2.0

Window
{
    property int n;
    id:tlW
    width: (9/16)*Screen.height
    height: Screen.height
    visible: true
    color:"#EEF7F0"
    Flickable {
        id: flickable1
        boundsBehavior: Flickable.DragAndOvershootBounds
        interactive: true
        flickableDirection: Flickable.VerticalFlick
        anchors.fill:parent
        contentHeight: parent.height*4
        Rectangle
        {
            id: rectFlick
            width:flickable1.width
            height:parent.height*4
            color:"#EEF7F0"
            Rectangle {
                id: rDockLeft
                width: parent.width/2-30
                height: parent.height
                color: "#EEF7F0"
                anchors.left: parent.left
                anchors.leftMargin: S.scaleX(parent,2)
                ListView {
                    id: lvLeft
                    interactive: false
                    anchors.fill: parent
                    delegate:Item{
                        width: rDockLeft.width
                        height: 200
                        Rectangle
                        {
                            width:rDockLeft.width
                            height: itemTitleLeft.height*1.5+90
                            color:"transparent"
                            Image {
                                id: bubleLeft
                                source: "http://192.168.1.123/images/bubble_left.png"
                                anchors.fill: parent
                            }
                            Text
                            {
                                id:dateLeft
                                x:S.scaleX(parent,5)
                                y:S.scaleY(parent,0)
                                font.pixelSize: 45
                                text:"01"
                            }
                            Text
                            {
                                id:dayLeft
                                x:S.scaleX(parent,25)
                                y:S.scaleY(parent,5)
                                font.pixelSize: 25
                                text:"Thursday"
                            }
                            Text
                            {
                                id:monthLeft
                                x:S.scaleX(parent,25)
                                y:S.scaleY(parent,25)
                                font.pixelSize: 15
                                color: "#9A9A9A"
                                text:"October"
                            }
                            Text
                            {
                                id:yearLeft
                                x:S.scaleX(parent,45)
                                y:S.scaleY(parent,25)
                                font.pixelSize: 15
                                font.bold: true
                                text:"2014"
                            }
                            Text
                            {
                                id:itemTitleLeft
                                x:S.scaleX(parent,5)
                                y:S.scaleY(parent,50)
                                text:itemText
                                color:"#A5A5A5"
                                width:parent.width-S.scaleX(parent,25)
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                    model: lmLeft
                }
            }

            Rectangle {
                id: rDockCenter
                width: S.scaleX(parent,3)
                height: parent.height
                color: "#EEF7F0"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.leftMargin: S.scaleX(parent,2)

                ListView {
                    id: lvCenter
                    interactive: false
                    anchors.fill: parent
                    delegate: Item
                    {
                        width: S.scaleX(rDockCenter,100)
                        height: 200
                        anchors.horizontalCenter:parent.horizontalCenter
                        Rectangle {
                           y:50
                           width: S.scaleX(parent,20)
                           height: 150
                           color: "#37B0BA"
                           anchors.horizontalCenter:parent.horizontalCenter
                        }
                        Rectangle{
                            y:10
                            width: 20
                            height: 20
                            rotation: 45
                            color: "#37B0BA"
                            anchors.horizontalCenter:parent.horizontalCenter
                        }
                    }
                    model: lmRight
                }
            }

            Rectangle {
                id: rDockRight
                width: parent.width/2-30
                height: parent.height
                color: "#EEF7F0"
                anchors.right: parent.right
                anchors.top:parent.top
                anchors.rightMargin: S.scaleX(parent,2)
                anchors.topMargin: 100
                ListView {
                    id: lvRight
                    interactive: false
                    anchors.fill: parent
                    delegate: Item {
                        width: rDockRight.width
                        height: 200
                        Rectangle
                        {
                            width:rDockRight.width
                            height: itemTitleRight.height*1.5+90
                            color:"transparent"
                            Image {
                                id: bubleRight
                                source: "http://192.168.1.123/images/bubble_right.png"
                                anchors.fill: parent
                            }
                            Text
                            {
                                id:dateRight
                                x:S.scaleX(parent,10)
                                y:S.scaleY(parent,0)
                                font.pixelSize: 45
                                text:dateTextRight
                            }
                            Text
                            {
                                id:dayRight
                                x:S.scaleX(parent,30)
                                y:S.scaleY(parent,5)
                                font.pixelSize: 25
                                text:dayTextRight
                            }
                            Text
                            {
                                id:monthRight
                                x:S.scaleX(parent,30)
                                y:S.scaleY(parent,25)
                                font.pixelSize: 15
                                color: "#9A9A9A"
                                text:montTextRight
                            }
                            Text
                            {
                                id:yearRight
                                x:S.scaleX(parent,50)
                                y:S.scaleY(parent,25)
                                font.pixelSize: 15
                                font.bold: true
                                text:yearTextRight
                            }
                            Text
                            {
                                id:itemTitleRight
                                x:S.scaleX(parent,10)
                                y:S.scaleY(parent,50)
                                text:itemText
                                color:"#A5A5A5"
                                width:parent.width-S.scaleX(parent,25)
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                    model: lmRight
                }
            }
        }
    }

    ListModel{id:lmLeft}
    ListModel{id:lmRight}
    ListModel{id:lmCenter}

    function padDateTime(dt) { //Add a preceding zero to months and days < 10
    return dt < 10 ? "0"+dt : dt;
    }
    function divideModel()
    {
        for(var i=0;i<xmlModel.count;i++)
        {
            var dateToParse = xmlModel.get(i).pDate;
            var a=dateToParse.split(' ');
            var rebuildDate =a[2]+' '+a[1]+' '+a[3];
            var nDate=new Date(rebuildDate);
            var getDay=Qt.formatDate(nDate,"dddd");
            var getDate=Qt.formatDate(nDate,"dd");
            var getMonth=Qt.formatDate(nDate,"MM");
            var getYear=Qt.formatDate(nDate,"yyyy");
            console.log(getDay+" "+getDate+" "+getMonth+" "+getYear);
            if((i%2)===0)
            {
                lmLeft.append({"itemText":xmlModel.get(i).title});
            }
            else
            {
                lmRight.append({"itemText":xmlModel.get(i).title});
            }
        }
    }

    XmlListModel
    {
        id:xmlModel
        source: "http://192.168.1.123/agenda.xml"
        query: "/rss/channel/item"
        XmlRole{name:"title";query:"title/string()"}
        XmlRole{name:"link";query:"link/string()"}
        XmlRole{name:"pDate";query:"pubDate/string()"}
        onStatusChanged:
        {
            if (status === XmlListModel.Ready)
            {
                divideModel();
            }
        }

    }

}

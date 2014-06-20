import QtQuick 2.0
import "Scaling.js" as Scales
import "Positioning.js" as Pos
import QtQuick.XmlListModel 2.0

Rectangle
{
    id:containerMaster
    anchors.fill:parent
    color:"transparent"

    FontLoader
    {
        id:argh
        source: "Aaargh.ttf"
    }


    //Waktu (Shadow)
    Text
    {
        id:txtWaktuShd
        color:"#888888"
        x:Scales.scaleX(containerMaster,2.5)
        y:Scales.scaleY(containerMaster,2.5)
        text:Qt.formatTime(new Date(),"hh:mm")
        font.family: argh.name
        font.pixelSize: Scales.scaleY(containerMaster,40)
    }

    //Waktu
    Text
    {
        id:txtWaktu
        color:"white"
        x:Scales.scaleX(containerMaster,2)
        y:Scales.scaleY(containerMaster,2)
        text:Qt.formatTime(new Date(),"hh:mm")
        font.family: argh.name
        font.pixelSize: Scales.scaleY(containerMaster,40)
    }

    // Digital Clock Timer per Minutes
    Timer
    {
        id:timerWaktu
        interval: 60000
        repeat: true
        running: true
        onTriggered:
        {
            txtWaktu.text=Qt.formatTime(new Date(),"hh:mm")
        }
    }

    //Tanggal (Shadow)
    Text
    {
        y:Pos.bottomOf(txtWaktu,-1*(Scales.scaleY(containerMaster,9.5)))
        x:Scales.scaleX(containerMaster,14.5)
        text:Qt.formatDate(new Date(),"dddd, dd MMMM yyyy")
        color:"#888888"
        font.family: argh.name
        font.pixelSize:Scales.scaleY(containerMaster,10)
    }

    //Tanggal
    Text
    {
        y:Pos.bottomOf(txtWaktu,-1*(Scales.scaleY(containerMaster,10)))
        x:Scales.scaleX(containerMaster,14)
        text:Qt.formatDate(new Date(),"dddd, dd MMMM yyyy")
        color:"white"
        font.family: argh.name
        font.pixelSize:Scales.scaleY(containerMaster,10)
    }


    MouseArea
    {
        anchors.fill: parent
        drag.target: parent
    }



    XmlListModel {
        id: weatherModel
        source: "http://weather.yahooapis.com/forecastrss?w=1048262"
        //source: "http://localhost/forecastrss.xml"
        query: "/rss/channel"

        //current condition
        /*
         <code number="0" description="tornado"/>
          <code number="1" description="tropical storm"/>
          <code number="2" description="hurricane"/>
          <code number="3" description="severe thunderstorms"/>
          <code number="4" description="thunderstorms"/>
          <code number="5" description="mixed rain and snow"/>
          <code number="6" description="mixed rain and sleet"/>
          <code number="7" description="mixed snow and sleet"/>
          <code number="8" description="freezing drizzle"/>
          <code number="9" description="drizzle"/>
          <code number="10" description="freezing rain"/>
          <code number="11" description="showers"/>
          <code number="12" description="showers"/>
          <code number="13" description="snow flurries"/>
          <code number="14" description="light snow showers"/>
          <code number="15" description="blowing snow"/>
          <code number="16" description="snow"/>
          <code number="17" description="hail"/>
          <code number="18" description="sleet"/>
          <code number="19" description="dust"/>
          <code number="20" description="foggy"/>
          <code number="21" description="haze"/>
          <code number="22" description="smoky"/>
          <code number="23" description="blustery"/>
          <code number="24" description="windy"/>
          <code number="25" description="cold"/>
          <code number="26" description="cloudy"/>
          <code number="27" description="mostly cloudy (night)"/>
          <code number="28" description="mostly cloudy (day)"/>
          <code number="29" description="partly cloudy (night)"/>
          <code number="30" description="partly cloudy (day)"/>
          <code number="31" description="clear (night)"/>
          <code number="32" description="sunny"/>
          <code number="33" description="fair (night)"/>
          <code number="34" description="fair (day)"/>
          <code number="35" description="mixed rain and hail"/>
          <code number="36" description="hot"/>
          <code number="37" description="isolated thunderstorms"/>
          <code number="38" description="scattered thunderstorms"/>
          <code number="39" description="scattered thunderstorms"/>
          <code number="40" description="scattered showers"/>
          <code number="41" description="heavy snow"/>
          <code number="42" description="scattered snow showers"/>
          <code number="43" description="heavy snow"/>
          <code number="44" description="partly cloudy"/>
          <code number="45" description="thundershowers"/>
          <code number="46" description="snow showers"/>
          <code number="47" description="isolated thundershowers"/>
          <code number="3200" description="not available"/>
              */

        namespaceDeclarations: "declare namespace yweather = 'http://xml.weather.yahoo.com/ns/rss/1.0';"
        XmlRole { name: "kota"; query: "yweather:location/@city/string()" }
        XmlRole { name: "suhu"; query: "item/yweather:condition/@temp/string()" }
        XmlRole { name: "condition"; query: "item/yweather:condition/@text/string()" }
        XmlRole { name: "kelembaban"; query: "yweather:atmosphere/@humidity/string()" }
        XmlRole { name: "tekanan"; query: "yweather:atmosphere/@pressure/string()" }

        onStatusChanged:
        {
            if (status===XmlListModel.Ready)
            {
                console.log("kota:"+weatherModel.get(0).kota)
                console.log("suhu:"+weatherModel.get(0).suhu)
                console.log("tek:"+weatherModel.get(0).tek)
                console.log("lembab:"+weatherModel.get(0).lembab)
                console.log("tekanan:"+weatherModel.get(0).tekanan)
            }
        }
    }

}


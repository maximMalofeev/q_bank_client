import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12

Rectangle{
  id: root
  property string currency
  property string account
  property int amount
  radius: 10
  RowLayout{
    anchors.fill: parent
    spacing: 20
    Rectangle{
      Layout.leftMargin: 10
      width: 60
      height: 60
      radius: 30
      color: "dodgerblue"
      Label{
        anchors.centerIn: parent
        text: root.currency
        font.pixelSize: 25
        font.weight: Font.DemiBold
        color: "white"
      }
    }
    Column{
      property int fontPixelSize: 16
      Layout.fillWidth: true
      Layout.leftMargin: 20
      spacing: 5
      Label{
        text: root.account
        font.pixelSize: parent.fontPixelSize
      }
      Label{
        text: root.amount + " " + root.currency
        font.pixelSize: parent.fontPixelSize
        font.bold: true
      }
    }
  }
}

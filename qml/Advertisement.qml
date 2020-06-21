import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12


RadiusImage{
  id: root

  property int fontPixelSize: 15
  property string title
  property string description

  source: "../images/advertisement_background.jpg"
  radius: 10

  Label{
    id: advertisementTitle
    anchors{
      horizontalCenter: parent.horizontalCenter
      top: root.top
      topMargin: 10
    }
    text: root.title
    font.pixelSize: root.fontPixelSize + 2
    font.weight: Font.DemiBold
  }
  Label{
    id: advertisementDescr
    anchors{
      horizontalCenter: parent.horizontalCenter
      top: advertisementTitle.bottom
      topMargin: 5
    }
    width: parent.width
    wrapMode: Text.WordWrap
    horizontalAlignment: Text.AlignHCenter
    font.pixelSize: root.fontPixelSize
    text: root.description
  }
}

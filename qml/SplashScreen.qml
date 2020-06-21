import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Rectangle{
  id: root
  color: "yellow"
  Label{
    anchors.centerIn: parent
    text: "Мой \nБанк"
    font.pixelSize: 22
    font.bold: true
    horizontalAlignment: Text.AlignHCenter
    padding: 10
    background: Rectangle{
      border.width: 2
      color: "transparent"
      radius: 10
    }
  }
}

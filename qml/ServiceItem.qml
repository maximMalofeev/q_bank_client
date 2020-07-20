import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
  id: root

  property alias source: img.source
  property alias title: label.text

  implicitHeight: layout.implicitHeight

  ColumnLayout{
    id: layout
    anchors.fill: parent
    RadiusImage {
      id: img
      Layout.fillWidth: true
      Layout.preferredHeight: layout.width

      radius: 10
      fillMode: Image.PreserveAspectCrop
    }
    Label{
      id: label
      Layout.fillWidth: true

      font.pixelSize: 14
      horizontalAlignment: Text.AlignHCenter
    }
  }
}

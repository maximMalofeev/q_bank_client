import QtQuick 2.12
import QtGraphicalEffects 1.0

Image{
  id: root

  property int radius: 0

  layer.enabled: true
  layer.effect: OpacityMask {
    maskSource: Item {
      width: root.width
      height: root.height
      Rectangle {
        anchors.centerIn: parent
        width: root.width
        height: root.height
        radius: root.radius
      }
    }
  }
}

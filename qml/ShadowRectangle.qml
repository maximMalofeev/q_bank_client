import QtQuick 2.12
import QtGraphicalEffects 1.0

Rectangle{
  radius: 10
  layer.enabled: true
  layer.effect: DropShadow {
    transparentBorder: true
    horizontalOffset: 1
    verticalOffset: 1
    color: "grey"
  }
}


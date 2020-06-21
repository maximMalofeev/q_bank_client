import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12

Page{
  id: root

  property alias model: paymentsList.model

  implicitWidth: 400
  padding: 2

  header: Label{
    text: root.title
    leftPadding: 15
    bottomPadding: 5
    topPadding: 5
    font.pixelSize: 20
    font.weight: Font.DemiBold
    Rectangle{
      anchors{
        bottom: parent.bottom
        left: parent.left
        right: parent.right
      }
      color: "grey"
      height: 4
    }
  }

  contentItem: ListView{
    id: paymentsList
    width: root.width
    implicitHeight: contentHeight
    spacing: 10

    delegate: Item{
      id: paymentItem
      width: paymentsList.width
      height: 40
      RowLayout{
        anchors.fill: parent
        spacing: 15

        Image{
          id: itemImage
          Layout.leftMargin: 15
          Layout.preferredHeight: 35
          Layout.preferredWidth: 35
          Layout.alignment: Qt.AlignVCenter
          source: model.img
          smooth: true
        }
        Rectangle{
          Layout.fillWidth: true
          height: 40
          color: "transparent"
          Column{
            anchors.fill: parent
            Label{
              text: model.title
              font.pixelSize: 15
            }
            Label{
              text: model.description
              font.pixelSize: 12
            }
          }
          Rectangle{
            anchors{
              bottom: parent.bottom
              left: parent.left
              right: parent.right
            }

            color: "darkgrey"
            height: 1
            visible: model.index !== paymentsList.count - 1
          }
        }
      }
    }
  }
  background: Rectangle{
    radius: 10
  }
}

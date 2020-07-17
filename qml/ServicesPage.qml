import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import QtQuick.Controls.Material 2.12

Pane {
  id: root

  ListView{
    id: list
    anchors.fill: parent
    spacing: 5

    header: Rectangle{
      width: list.width
      height: searchRow.implicitHeight + 10
      RowLayout{
        id: searchRow
        width: parent.width
        spacing: 25

        TextField{
          id: searchField

          Layout.fillWidth: true
          Layout.alignment: Qt.AlignVCenter

          topPadding: 5
          bottomPadding: 5
          leftPadding: 40

          placeholderText: "Поиск"
          font.pixelSize: Qt.application.font.pixelSize + 2
          verticalAlignment: TextInput.AlignVCenter

          background: Rectangle {
            radius: 20
            color: "whitesmoke"

            RoundButton {
              id: searchImage
              Material.elevation: 0
              anchors.verticalCenter: parent.verticalCenter
              x: 14
              display: AbstractButton.IconOnly
              padding: 0
              implicitWidth: 13
              implicitHeight: 13
              enabled: false
              icon{
                source: "../images/search.png"
                color: "grey"
              }
            }
          }
        }
        RoundButton{
          id: voiceSearch
          Material.elevation: 0
          Layout.alignment: Qt.AlignVCenter
          display: AbstractButton.IconOnly
          padding: 0
          implicitWidth: 34
          implicitHeight: 34
          background: Rectangle{}
          icon{
            source: "../images/voice_search.png"
            color: "blue"
          }
        }
      }
    }

    model: ObjectModel{
      Item{
        width: list.width
        height: grid.implicitHeight
        GridLayout{
          id: grid
          columns: 3
          Repeater{
            model: 9
            ShadowRectangle{
              implicitWidth: list.width / grid.columns - (grid.columns - 1) * grid.columnSpacing / grid.columns
              implicitHeight: implicitWidth
              color: "red"
            }
          }
        }
      }
      ShadowRectangle{
        width: list.width
        height: 150
        color: "blue"
      }
      Item{
        width: list.width
        height: 150

        SwipeView{
          id: swipe
          anchors.fill: parent
          clip: true

          Rectangle{
            implicitWidth: list.width
            implicitHeight: 150
            color: "yellow"
          }
          Rectangle{
            implicitWidth: list.width
            implicitHeight: 150
            color: "green"
          }
        }
        PageIndicator {
          id: indicator

          count: swipe.count
          currentIndex: swipe.currentIndex

          anchors.bottom: swipe.bottom
          anchors.horizontalCenter: parent.horizontalCenter
        }
      }
    }
  }
}

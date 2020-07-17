import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12

Page{
  id: root
  implicitWidth: 480
  implicitHeight: 640

  SwipeView {
    id: swipe
    anchors.fill: parent
    currentIndex: 1

    MainPage {}
    PaymentsPage {}
    ServicesPage {}
    Rectangle{
      color: "green"
    }
  }

  footer: ToolBar{
    id: toolBar
    Material.primary: "white"
    height: row.implicitHeight

    RowLayout{
      id: row

      ListModel{
        id: toolButtonsModel
        ListElement { text: "Главная"; icon: "../images/credit_card.png" }
        ListElement { text: "Платежи"; icon: "../images/rubel.png" }
        ListElement { text: "Сервисы"; icon: "../images/star.png" }
        ListElement { text: "Еще"; icon: "../images/more.png" }
      }

      Repeater{
        model: toolButtonsModel
        ToolButton{
          text: model.text
          icon{
            source: model.icon
            color: model.index == swipe.currentIndex ? "blue" : "grey"
            width: 20
            height: 20
          }
          Layout.preferredWidth: toolBar.width / 4
          display: AbstractButton.TextUnderIcon

          onClicked: {
            swipe.currentIndex = model.index
          }
        }
      }
    }
  }
}

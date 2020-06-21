import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12

Pane{
  id: root

  ListView{
    id: rootList
    anchors.fill: parent
    spacing: 4
    boundsBehavior: Flickable.StopAtBounds
    headerPositioning: ListView.OverlayHeader

    header: Rectangle{
      id: header
      color: "transparent"
      width: rootList.width
      height: headerTitle.height + headerList.height +
              headerList.anchors.topMargin + rootList.spacing + 5
      Label{
        id: headerTitle
        anchors{
          top: parent.top
        }

        text: "История"
        font.pixelSize: 20
        font.weight: Font.DemiBold
      }
      ListView{
        id: headerList
        anchors{
          top: headerTitle.bottom
          topMargin: 4
        }
        width: parent.width
        height: 50
        orientation: ListView.Horizontal
        spacing: 4
        model: ListModel{
          ListElement{ title: "Перевод"; recipient: "Жена"; amount: 5000 }
          ListElement{ title: "Оплата"; recipient: "Пятерочка"; amount: 500 }
          ListElement{ title: "Отплата"; recipient: "Ашан"; amount: 1000 }
          ListElement{ title: "Перевод"; recipient: "Тренер"; amount: 800 }
          ListElement{ title: "Оплата"; recipient: "Интернет Магазин"; amount: 3000 }
          ListElement{ title: "Оплата"; recipient: "Пятерочка"; amount: 1500 }
          ListElement{ title: "Перевод"; recipient: "Олег Петров"; amount: 500 }
        }

        delegate: Rectangle{
          height: headerList.height
          width: headerItem.implicitWidth + headerItem.anchors.leftMargin +
                 headerItem.anchors.rightMargin
          radius: 10
          color: "honeydew"
          Column{
            id: headerItem
            anchors{
              left: parent.left
              right: parent.right
              verticalCenter: parent.verticalCenter
              leftMargin: 5
              rightMargin: 5
            }

            Label{
              id: itemTitle
              text: "Операция: " + model.title
              font{
                pixelSize: 13
                weight: Font.DemiBold
              }

            }
            Label{
              id: itemRecipient
              text: "Получатель: " + model.recipient
            }
            Label{
              id: itemAmount
              text: "Сумма: " + model.amount
            }
          }
        }
      }

      visible: rootList.contentY < 0
      OpacityMask {
        source: mask
        maskSource: header
      }

      LinearGradient {
        id: mask
        anchors.centerIn: parent
        width: root.width
        height: parent.height
        gradient: Gradient {
          GradientStop { position: rootList.contentY <= 0.0 ? (Math.abs(rootList.contentY) / header.height - 0.150) : 0; color: "transparent" }
          GradientStop { position: rootList.contentY <= 0.0 ? (Math.abs(rootList.contentY) / header.height - 0.050) : 0; color: "white" }
        }
      }
    }

    Component{
      id: commonBackground
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
    }

    model: ObjectModel{
      PaymentsItem {
        width: rootList.width
        title: "Платежи"
        model: ListModel{
          ListElement { img: "../images/mobile.png"; title: "Мобильная связь"; description: "Оплатите мобильную связь не выходя из дома" }
          ListElement { img: "../images/receipt.png"; title: "ЖКХ"; description: "ЖКХ платежи не выходя из дома" }
          ListElement { img: "../images/internet.png"; title: "Интернет"; description: "Интернет платежи не выходя из дома" }
          ListElement { img: "../images/bus.png"; title: "Транспорт"; description: "Положить деньги на транспортную карту" }
        }
        background: Loader{ sourceComponent: commonBackground }
      }
      Advertisement {
        width: rootList.width
        height: 90
        title: "Очередное новое горячее предложение!"
        description: "Кредитная карта с лимитом в 400000\u20bd специально для вас!"
      }
      PaymentsItem {
        width: rootList.width
        title: "Переводы"
        model: ListModel{
          ListElement { img: "../images/transfer.png"; title: "Между своими счетами"; description: "Перевести на другой счет" }
          ListElement { img: "../images/bank_transfer.png"; title: "Клиенту Моего Банка"; description: "Перевести деньги клиенту Моего Банка без процентов" }
          ListElement { img: "../images/person_transfer.png"; title: "Другому человеку"; description: "Перевести деньги клиенту другого банка" }
          ListElement { img: "../images/world_transfer.png"; title: "За рубеж"; description: "Перевести деньги за рубеж" }
        }
        background: Loader{ sourceComponent: commonBackground }
      }
    }
  }
}

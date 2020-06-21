import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12

Pane{
  implicitWidth: 480
  implicitHeight: 640
  topPadding: 0

  ListView{
    id: root
    anchors.fill: parent
    spacing: 10
    clip: false
    model: ObjectModel{
      ListView{
        id: stories
        height: 100
        width: root.width
        orientation: ListView.Horizontal
        model: ListModel{
          id: storiesModel
          ListElement{ img: "../images/money1.jpg"; text: "Супер новое предложение!" }
          ListElement{ img: "../images/money2.jpg"; text: "Выгодные условия по кредиту специально для вас." }
          ListElement{ img: "../images/money3.jpg"; text: "Защитись от мошенников." }
          ListElement{ img: "../images/money4.jpg"; text: "Выгодные условия по ипотеке." }
          ListElement{ img: "../images/money5.jpg"; text: "Повышенный кешбек." }
        }
        spacing: 4
        delegate: Rectangle{
          id: story
          width: stories.height
          height: stories.height
          radius: 10
          clip: true
          color: "grey"

          Image{
            id: storyImg
            anchors.fill: parent
            source: model.img
            layer.enabled: true
            layer.effect: OpacityMask {
              maskSource: Item {
                width: storyImg.width
                height: storyImg.height
                Rectangle {
                  anchors.centerIn: parent
                  width: storyImg.width
                  height: storyImg.height
                  radius: story.radius
                }
              }
            }
          }

          Label{
            anchors{
              bottom: parent.bottom
              horizontalCenter: parent.horizontalCenter
              bottomMargin: 4
            }
            font.bold: true
            text: model.text
            width: parent.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            background: Rectangle{
              color: "gray"
              opacity: 0.65
            }
          }
        }
      }
      ColumnLayout{
        id: accounts
        width: root.width
        spacing: 2

        Repeater{
          model: ListModel{
            ListElement{ currency: "\u0024"; account: "Долларовый счет"; amount: 1500 }
            ListElement{ currency: "\u20ac"; account: "Счет в евро"; amount: 500 }
            ListElement{ currency: "\u20a3"; account: "Счет в фунтах"; amount: 432 }
            ListElement{ currency: "\u20bd"; account: "Счет в рублях"; amount: 80000 }
          }

          Account {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            currency: model.currency
            account: model.account
            amount: model.amount
          }
        }
      }

      Advertisement {
        width: root.width
        height: 90
        title: "Новое горячее предложение!"
        description: "Кредитная карта с лимитом в 400000\u20bd специально для вас!"
      }

      Account{
        id: investment
        height: 80
        width: root.width
        currency: "\u0024"
        account: "Инвестиционный счет"
        amount: 0
      }
    }

    boundsBehavior: Flickable.StopAtBounds
    headerPositioning: ListView.PullBackHeader
    header: Rectangle{
      id: header
      height: headerColumn.implicitHeight + 10
      width: parent.width
      clip: true
      z: 2
      Column{
        id: headerColumn
        anchors{
          fill: parent
          topMargin: 5
          leftMargin: 12
          rightMargin: 12
          bottomMargin: 5
        }
        spacing: 16

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
    }

    delegate: Rectangle{
      height: 25
      width: 480
      color: "grey"
      Text{
        text: modelData
      }
    }
  }
}

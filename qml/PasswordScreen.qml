import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

import "backend.js" as Backend

Pane{
  id: root

  PasswordHandler {
    id: passwordIndicator
    anchors.horizontalCenter: parent.horizontalCenter
    y: parent.height / 3

    title: "Имя Пользователя"
    totalCount: 4
    validator: Backend.checkPassword

    onAccepted: {
      console.log("Password accepted");
      root.StackView.view.replace("MainScreen.qml");
    }

    onRejected: {
      console.log("Password rejected");
      reset();
    }
  }

  GridLayout{
    id: pad
    readonly property int btnFontSize: Qt.application.font.pixelSize + 6

    anchors{
      bottom: parent.bottom
      bottomMargin: 10
      horizontalCenter: parent.horizontalCenter
    }
    columns: 3
    columnSpacing: 30
    rowSpacing: 10

    Repeater{
      model: 9
      RoundButton{
        Layout.alignment: Qt.AlignCenter
        text: index + 1
        font.pixelSize: pad.btnFontSize
        Material.elevation: 0
        onClicked: {
          passwordIndicator.push(index + 1);
        }
      }
    }

    RoundButton{
      Layout.alignment: Qt.AlignCenter
      Material.elevation: 0
      font{
        pixelSize: Qt.application.font.pixelSize - 1
      }
      text: "ВЫХОД"
      onClicked: {
        exitDialog.open()
      }
      contentItem: Label {
        verticalAlignment: Qt.AlignVCenter
        text: parent.text
        color: "grey"
      }
    }
    RoundButton{
      Material.elevation: 0
      Layout.alignment: Qt.AlignCenter
      font.pixelSize: pad.btnFontSize
      text: "0"
      onClicked: {
        passwordIndicator.push(0);
      }
    }
    RoundButton{
      Material.elevation: 0
      Layout.alignment: Qt.AlignCenter
      font.pixelSize: Qt.application.font.pixelSize + 5
      icon.source: "../images/backspace.png"
      icon.color: "grey"
      onClicked: {
        passwordIndicator.pop();
      }
    }
  }

  Dialog{
    id: exitDialog
    anchors.centerIn: parent
    width: parent.width - 20
    title: "Подтверждение"
    leftPadding: 25
    rightPadding: 70
    modal: true
    header: Label{
      horizontalAlignment: Qt.AlignLeft
      verticalAlignment: Qt.AlignVCenter
      leftPadding: exitDialog.leftPadding
      topPadding: 20
      text: exitDialog.title
      font{
        pixelSize: Qt.application.font.pixelSize + 4
        weight: Font.DemiBold
      }
    }

    contentItem: Label{
      id: exitContent
      wrapMode: Text.WordWrap
      font.pixelSize: Qt.application.font.pixelSize + 2
      bottomPadding: 10
      text: "Вы уверены, что хотите сбросить код доступа и авторизоваться по номеру телефона?"
    }

    footer: Row{
      layoutDirection: Qt.RightToLeft
      spacing: 20
      padding: 20
      topPadding: 10
      rightPadding: 40

      Label{
        text: "ОК"
        font{
          pixelSize: Qt.application.font.pixelSize + 1
        }
        color: "blue"
        MouseArea{
          anchors.fill: parent
          onClicked: exitDialog.close()
        }
      }
      Label{
        text: "ОТМЕНА"
        font{
          pixelSize: Qt.application.font.pixelSize + 1
        }
        color: "blue"
        MouseArea{
          anchors.fill: parent
          onClicked: exitDialog.close()
        }
      }
    }

    background: Pane{
      anchors.fill: parent
      background: Rectangle{
        radius: 20
      }
    }
  }
}

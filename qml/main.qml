import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

import "backend.js" as Backend

ApplicationWindow {
  id: window
  visible: true
  y: 30
  x: Screen.desktopAvailableWidth - width - 10
  width: 400
  height: 600
  title: "Мой Банк"

  StackView {
    id: stackView
    anchors.fill: parent
//    initialItem: SplashScreen{}
    initialItem: MainScreen{}

    PasswordScreen {
      id: passwordScreen
    }
  }

//  Timer{
//    interval: 1500
//    running: true
//    onTriggered: {
//      stackView.replace(passwordScreen);
//    }
//  }
}

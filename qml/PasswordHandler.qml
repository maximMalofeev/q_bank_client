import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Pane{
  id: root

  enum CurrentState{
    InputState = 0,
    AcceptedState,
    RejectedState
  }
  property int currentState: PasswordHandler.InputState
  property string title: ""
  property int totalCount: 0
  property int enteredCount: impl.password.length
  property var validator: function(password){ return true; }

  function push(input){
    if(currentState === PasswordHandler.InputState && input >= 0 && input <= 9){
      impl.password += input;
      if(impl.password.length === totalCount){
        if(validator(impl.password)){
          currentState = PasswordHandler.AcceptedState;
        }else{
          currentState = PasswordHandler.RejectedState;
        }
      }
    }
  }

  function pop(){
    if(impl.password.length){
      impl.password = impl.password.slice(0, -1);
    }
  }

  function reset(){
    currentState = PasswordHandler.InputState;
    impl.password = "";
  }

  signal accepted
  signal rejected

  implicitWidth: mainLayout.implicitWidth
  implicitHeight: mainLayout.implicitHeight
  state: "input"

  QtObject {
    id: impl
    property string password: ""
  }

  ColumnLayout{
    id: mainLayout
    
    spacing: 15
    anchors{
      horizontalCenter: parent.horizontalCenter
    }
    
    Label{
      Layout.alignment: Qt.AlignHCenter
      text: root.title
      font{
        pixelSize: Qt.application.font.pixelSize + 2
      }
    }
    Row{
      id: indicatorsRow

      property int itemSize: 13

      Layout.alignment: Qt.AlignHCenter
      spacing: 20
      Repeater{
        model: root.totalCount
        Rectangle{
          id: rect
          color: "lightgrey"
          width: indicatorsRow.itemSize
          height: width
          radius: width / 2
          smooth: true

          states: [
            State {
              name: "accepted"
              when: root.currentState === PasswordHandler.AcceptedState
              PropertyChanges {
                target: rect
                color: "green"
                scale: 1
              }
            },
            State {
              name: "rejected"
              when: root.currentState === PasswordHandler.RejectedState
              PropertyChanges {
                target: rect
                color: "red"
                scale: 1
              }
            },
            State {
              name: "filled"
              when: root.enteredCount > index  && root.currentState === PasswordHandler.InputState
              PropertyChanges {
                target: rect
                color: "blue"
                scale: 1
              }
            }
          ]

          transitions: [
            Transition {
              SequentialAnimation{
                NumberAnimation{
                  property: "scale"
                  to: 1.5
                  duration: 120
                  easing.type: Easing.InOutBack
                }
                NumberAnimation{
                  property: "scale"
                  to: 1
                  duration: 120
                  easing.type: Easing.InOutBack
                }
              }
            }
          ]
        }
      }
    }
  }

  states: [
    State {
      name: "input"
      when: root.currentState === PasswordHandler.InputState
      PropertyChanges{
        target: indicatorsRow
        spacing: 20
      }
    },
    State {
      name: "accepted"
      when: root.currentState === PasswordHandler.AcceptedState
      PropertyChanges{
        target: indicatorsRow
        spacing: -indicatorsRow.itemSize
      }
    },
    State {
      name: "rejected"
      when: root.currentState === PasswordHandler.RejectedState
    }
  ]

  transitions: [
    Transition{
      from: "input"
      to: "accepted"
      SequentialAnimation{
        NumberAnimation{
          property: "spacing"
          duration: 300;
          easing.type: Easing.InBack;
        }

        PauseAnimation {
          duration: 300
        }
      }

      onRunningChanged: {
        if(!running){
          accepted();
        }
      }
    },
    Transition {
      from: "input"
      to: "rejected"
      PauseAnimation {
        duration: 500
      }

      onRunningChanged: {
        if(!running){
          rejected();
        }
      }
    }
  ]
}

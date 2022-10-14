import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    function gui(wght, hght) {
        var Height = Math.max(600.0, hght)
        var Width = Math.max(600.0, wght)
        var coef = (Math.max(Height, Width) / 640);
        if(coef != 1.0) {
            coef = (coef * 0.2) + 0.5
        }
        return coef;
    }

    id: main
    objectName: "main"
    width: Screen.width
    height: Screen.height
    readonly property double guiCoef: gui(width, height)
    visible: true
    title: qsTr("Calculator")
    color: "black"
    Rectangle {
        id: textedit
        width: main.width
        height: 50
        x: 2
        border.color: "black"
        border.width: 5
        color: "gray"
        opacity: 2
        TextEdit {
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 40
            TextInput {
                objectName: "maintxt"
                font.pointSize: 30
                font.family: "Times New Roman"
                color: "black"
                id: maintxt
                text: ""
                focus: true
                validator : RegularExpressionValidator { regularExpression : /^(([0-9]*)|(([0-9]*)\\.([0-9]*)))/ }
            }
        }
    }
    Rectangle {
        id: buttons
        x: main.width / 2 - 150
        y: textedit.height
        color: "black"
        width: main.width
        height: main.height
        border.color: "black"
        border.width: 5
        RoundButton {
            id: seven
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: 10 * guiCoef
            y: 10 * guiCoef
            text: "7"
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += "7"
        }
        RoundButton {
            id: four
            text: "4"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: 10 * guiCoef
            y: (55 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("4")
        }
        RoundButton {
            id: one
            text: "1"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: 10 * guiCoef
            y: (110 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("1")
        }
        RoundButton {
            id: zero
            text: "0"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: 10 * guiCoef
            y: (165 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("0")
        }
        RoundButton {
            id: eight
            text: "8"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (60 + 10) * guiCoef
            y: 10 * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("8")
        }
        RoundButton {
            id: five
            text: "5"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (60 + 10) * guiCoef
            y: (55 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("5")
        }
        RoundButton {
            id: two
            text: "2"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (60 + 10) * guiCoef
            y: (110 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("2")
        }
        RoundButton {
            id: nine
            text: "9"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (120 + 10) * guiCoef
            y: 10 * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("9")
        }
        RoundButton {
            id: six
            text: "6"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (120 + 10) * guiCoef
            y: (55 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("6")
        }
        RoundButton {
            id: three
            text: "3"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (120 + 10) * guiCoef
            y: (110 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "gray"
            onClicked: maintxt.text += ("3")
        }
        RoundButton {
            id: proc
            text: "%"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (120 + 10) * guiCoef
            y: (165 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (" % ")
        }
        RoundButton {
            id: dot
            text: "."
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (60 + 10) * guiCoef
            y: (165 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (".")
        }
        RoundButton {
            id: dev
            text: "/"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (175 + 10) * guiCoef
            y: 10 * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (" / ")
        }
        RoundButton {
            id: mult
            text: "*"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (175 + 10) * guiCoef
            y: (55 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (" * ")
        }
        RoundButton {
            id: minus
            text: "-"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (175 + 10) * guiCoef
            y: (110 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (" - ")
        }
        RoundButton {
            id: plus
            text: "+"
            width: 50 * guiCoef
            height: 50 * guiCoef
            x: (175 + 10) * guiCoef
            y: (165 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "green"
            onClicked: maintxt.text += (" + ")
        }
        RoundButton {
            id: clear
            objectName: "clear"
            signal totalCleared()
            text: "C"
            width: 100 * guiCoef
            height: 110 * guiCoef
            x: (225 + 10) * guiCoef
            y: 10 * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "red"
            onClicked: {
                totalCleared()
                maintxt.text = ("")
            }
        }
        RoundButton {
            id: total
            objectName: "total"
            signal totalClicked(string msg)
            text: "="
            width: 100 * guiCoef
            height: 110 * guiCoef
            x: (225 + 10) * guiCoef
            y: (110 + 10) * guiCoef
            font.pointSize: 20
            palette.buttonText: "black"
            palette.button: "yellow"
            onClicked: {
                totalClicked(maintxt.text)
                maintxt.text = main.res
            }
        }

    }
}

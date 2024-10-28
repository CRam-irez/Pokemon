import QtQuick.Controls.Fusion 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick 2.13
import Qt5Compat.GraphicalEffects
import QtQuick3D


ToolBar {
    id: searchFilterTools

    // Expose setsModel to the outside world
    property var setsModel

    property bool grassChecked: grassTypeButton.checked
    property bool fireChecked: fireTypeButton.checked
    property bool waterChecked: waterTypeButton.checked
    property bool lightningChecked: lightningTypeButton.checked
    property bool psychicChecked: psychicTypeButton.checked
    property bool fightingChecked: fightingTypeButton.checked
    property bool darknessChecked: darknessTypeButton.checked
    property bool metalChecked: metalTypeButton.checked
    property bool colorlessChecked: colorlessTypeButton.checked
    property bool fairyChecked: fairyTypeButton.checked
    property bool dragonChecked: dragonTypeButton.checked
    property alias colorlessTypeButton: colorlessTypeButton



    Row {
        id: filtersRow
        visible: false
        anchors.fill: parent
        anchors.leftMargin: -6
        anchors.rightMargin: -6
        z: 2
        spacing: 2
    }

    Rectangle {
        id: rectangle4
        y: 0
        height: 60
        color: "#00ffffff"
        radius: 1
        border.color: "#6c0101"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        z: 1
    }

    Rectangle {
        id: rectangle8
        y: 0
        height: 60
        color: "#cc1c1c"
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0

        Rectangle {
            id: rectangle32
            color: "#00ffffff"
            radius: 4
            border.color: "#ee0000"
            border.width: 2
            anchors.fill: parent
        }
    }

    Row {
        id: typesRow
        x: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 4
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        Layout.leftMargin: 6
        spacing: 4
        Layout.preferredWidth: -1
        Layout.preferredHeight: -1
        Layout.fillHeight: false
        Layout.fillWidth: false
        Layout.rightMargin: 6

        Component.onCompleted: {
            const typeImageMap = {
                "grass": "https://images.pokemontcg.io/sm1/164_hires.png",
                "fire": "https://images.pokemontcg.io/sm1/165_hires.png",
                "water": "https://images.pokemontcg.io/sm1/166_hires.png",
                "lightning": "https://images.pokemontcg.io/sm1/167_hires.png",
                "psychic": "https://images.pokemontcg.io/sm1/168_hires.png",
                "fighting": "https://images.pokemontcg.io/sm1/169_hires.png",
                "darkness": "https://images.pokemontcg.io/sm1/170_hires.png",
                "metal": "https://images.pokemontcg.io/sm1/171_hires.png",
                "fairy": "https://images.pokemontcg.io/sm1/172_hires.png",
                "dragon": "https://images.pokemontcg.io/xy6/97_hires.png",
                "colorless": "https://images.pokemontcg.io/swsh3/176_hires.png"
            };

            // Update cost images for cost1, cost2, cost3, cost4, and cost5
            grassImage.source = typeImageMap["grass"];
            fireImage.source = typeImageMap["fire"];
            waterImage.source = typeImageMap["water"];
            lightningImage.source = typeImageMap["lightning"];
            psychicImage.source = typeImageMap["psychic"];
            fightingImage.source = typeImageMap["fighting"];
            darknessImage.source = typeImageMap["darkness"];
            metalImage.source = typeImageMap["metal"];
            fairyImage.source = typeImageMap["fairy"];
            //dragonImage.source = typeImageMap["dragon"];
           // colorlessImage.source = typeImageMap["colorless"];

            grassDimmer.visible = grassTypeButton.checked;
            fireDimmer.visible = fireTypeButton.checked;
            waterDimmer.visible = waterTypeButton.checked;
            lightningDimmer.visible = lightningTypeButton.checked;
            psychicDimmer.visible = psychicTypeButton.checked;
            fightingDimmer.visible = fightingTypeButton.checked;
            darknessDimmer.visible = darknessTypeButton.checked;


        }

        RoundButton {
            id: grassTypeButton
            Layout.fillWidth: false
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            checkable: true
            checked: false
            flat: false
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            highlighted: grassTypeButton.checked
            hoverEnabled: true
            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0
            ToolTip.text: qsTr("Grass")
            palette {
                button: "green"
            }
            onClicked: {
                grassDimmer.visible = grassTypeButton.checked
            }

            width: 50
            padding: 0

            Rectangle {
                id: grassImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: grassImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/164_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: grassMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: grassDimmer
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: grassMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: fireTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: fireTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "red"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Fire")

            padding: 0

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                fireDimmer.visible = fireTypeButton.checked
            }
            Rectangle {
                id: fireImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: fireImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/165_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: fireMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: fireDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: fireMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: waterTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: waterTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "blue"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Water")

            padding: 0

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                waterDimmer.visible = waterTypeButton.checked
            }
            Rectangle {
                id: waterImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: waterImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/166_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: waterMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: waterDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: waterMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: lightningTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: lightningTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "gold"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Lightning")

            padding: 0

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                lightningDimmer.visible = lightningTypeButton.checked
            }
            Rectangle {
                id: lightningImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: lightningImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/167_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: lightningMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: lightningDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: lightningMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: psychicTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: psychicTypeButton.checked
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "darkviolet"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Psychic")

            padding: 0

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                psychicDimmer.visible = psychicTypeButton.checked
            }
            Rectangle {
                id: psychicImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: psychicImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/168_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: psychicMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: psychicDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: psychicMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }



        }

        RoundButton {
            id: fightingTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: fightingTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "saddlebrown"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Fighting")

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                fightingDimmer.visible = fightingTypeButton.checked
            }

            padding: 0
            Rectangle {
                id: fightingImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: fightingImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/169_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: fightingMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: fightingDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: fightingMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: darknessTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: darknessTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "darkslategrey"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Darkness")

            padding: 0

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                darknessDimmer.visible = darknessTypeButton.checked
            }
            Rectangle {
                id: darknessImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: darknessImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/170_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: darknessMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: darknessDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: darknessMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: metalTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: metalTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "lightgrey"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Metal")

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            onClicked: {
                metalDimmer.visible = metalTypeButton.checked
            }

            padding: 0
            Rectangle {
                id: metalImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: metalImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/171_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: metalMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: metalDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: metalMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: fairyTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            clip: false
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: fairyTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "hotpink"
            }
            hoverEnabled: true
            padding: 0

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Fairy")

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0
            onClicked: {
                fairyDimmer.visible = fairyTypeButton.checked
            }

            Rectangle {
                id: fairyImageBlock
                x: -6
                y: -6
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9
                Image {
                    id: fairyImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    source: "https://images.pokemontcg.io/sm1/172_hires.png"
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: fairyMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false

                    Rectangle {
                        id: fairyDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    id: fairyMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                clip: true
            }

        }

        RoundButton {
            id: dragonTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            clip: false
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            highlighted: dragonTypeButton.checked
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "goldenrod"
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Dragon")

            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0

            icon.source: "dragonEnergyCropped.png"
            icon.height: 50
            icon.width: 50
            padding: 0

            onClicked: {
                dragonDimmer.visible = dragonTypeButton.checked
            }

        }

        RoundButton {
            id: colorlessTypeButton
            width: 50
            height: 50
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            highlighted: false
            Layout.preferredHeight: 24
            Layout.preferredWidth: 24
            Layout.rowSpan: 1
            flat: false
            checked: false
            checkable: true
            Layout.fillWidth: false
            Layout.fillHeight: false
            palette {
                button: "white"
            }

            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Colorless")

            padding: 0
            icon.source: "colorlessEnergyCropped.png"
            icon.height: 50
            icon.width: 50
            // Change scale when hovered
            scale: hovered ? 1.2 : 1.0


            onClicked: {
                colorlessDimmer.visible = colorlessTypeButton.checked
            }
        }
    }

    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: principledMaterial
            objectName: "New Material"
        }
    }
}



import QtQuick 2.13
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import Qt5Compat.GraphicalEffects


Item { // Page 2: Discover Page

    focus: true
    id: discoverPage
    width: 600
    height: 600
    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
    Layout.preferredWidth: 600
    Layout.preferredHeight: 600
    Layout.fillHeight: false
    Layout.fillWidth: false

    property int selectedIndex: 0
    property var cards: [] // List of card objects

    function updateTypeInfo() {
        const defaultType1 = "Type 1";
        const defaultType2 = "Type 2";

        // Type mapping for potential image sources (update URLs if needed)
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
            "dragon": "dragonEnergyCropped.png",
            "colorless": "colorlessEnergyCropped.png"
        };

        // Check if the card exists
        if (!cards[selectedIndex]) {
            // console.log("cards[selectedIndex] doesn't exist")
            // Reset to defaults if no card is selected
            typeBlock1.type1Type = defaultType1;
            typeBlock1.type2Type= defaultType2;
            return; // Exit early if no card is found
        }
        else {
            //  console.log(cards[selectedIndex].type1)
        }

        // Normalize type strings for image source mapping
        const normalizedType1 = cards[selectedIndex]?.type1?.trim().toLowerCase() || "";
        const normalizedType2 = cards[selectedIndex]?.type2?.trim().toLowerCase() || "";

        typeBlock1.type1Type = normalizedType1 || defaultType1;
        typeBlock1.type2Type = normalizedType2 || defaultType2;

        if(typeBlock1.type1Type === defaultType1 && typeBlock.type2Type === defaultType2) {

            typeBlock1.visible = false;
        }
        else {
            typeBlock1.visible = true;
        }

        if(typeBlock1.visible && subtypeBlock1.visible) {

            typesRow1.width = typeBlock1.width + subtypeBlock1.width

        } else if (typeBlock1.visible && !subtypeBlock1.visible) {

            typesRow1.width = typeBlock1.width

        } else if (!typeBlock1.visible && subtypeBlock1.visible) {
            typesRow1.width = subtypeBlock1.width
        }


    }

    function resetCardRotation() {
        momentumTimer.stop()
        cardNode.eulerRotation.y = 0;
    }
    function resetLeftColumnScroll() {
        //leftScrollView.contentX = 0;
        //leftScrollView.contentY = 0;
    }

    function resetRightColumnScroll() {
        //rightScrollView.contentX = 0;
        //rightScrollView.contentY = 0;
    }

    // Function to handle next button click
    function onNextCard() {
        if (selectedIndex < cards.length - 1) {
            selectedIndex++
            resetLeftColumnScroll();
            resetRightColumnScroll();
            resetCardRotation();
            updateLeftScrollView();
            //updateRightScrollView();
        }
    }

    // Function to handle next button click
    function onPrevCard() {
        if (selectedIndex >= 0) {
            selectedIndex--
            resetLeftColumnScroll();
            resetRightColumnScroll();
            resetCardRotation();
            //updateLeftScrollView();
            //updateRightScrollView();
        }
    }


    Column {
        id: column
        x: 0
        y: 0
        width: 600
        height: 600
        z: 1

        Rectangle {
            id: rectangle4
            height: 440
            visible: true
            color: deepBG
            radius: 0
            border.color: borderColor
            border.width: 4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            z: 1

            Pane {
                id: viewPane
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                verticalPadding: 6
                topPadding: 0
                rightPadding: 0
                leftPadding: 0
                horizontalPadding: 6
                contentWidth: 600
                contentHeight: 440
                Rectangle {
                    visible: true
                    color: dataFlow.color
                    radius: 0
                    border.color: "#00255864"
                    border.width: 0
                    anchors.fill: parent
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    z: 0
                }

                    MouseArea {
                        visible: true
                        anchors.fill: parent
                        anchors.leftMargin: 1
                        anchors.rightMargin: -1
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }


                    Rectangle {
                        id: rectangle2
                        x: -290
                        width: 274
                        height: 438
                        visible: true
                        color: "#00ffffff"
                        radius: 3
                        border.color: "#ff0000"
                        border.width: 4
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        z: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    anchors.verticalCenterOffset: 0

                Rectangle {
                    id: dataFlow
                    height: 440
                    opacity: 1
                    visible: true
                    color: "#541515"
                    border.width: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.horizontalCenter: parent.horizontalCenter
                    Frame {
                        id: frame
                        visible: true
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        padding: 0
                        rightPadding: 0
                        bottomPadding: 0
                        leftPadding: 0
                        topPadding: 0
                        clip: false
                        View3D {
                            id: view
                            width: 540
                            height: 430
                            scale: 1
                            clip: false
                            z: 0
                            visible: true
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            PerspectiveCamera {
                                y: 0
                                position: Qt.vector3d(0, 200, 300)
                                pivot.z: 0
                                pivot.y: 0
                                pivot.x: 0
                                lookAtNode: cardNode
                                frustumCullingEnabled: false
                                z: 0
                                eulerRotation.x: 0
                            }

                            DirectionalLight {
                                eulerRotation.x: -30
                            }

                            Node {
                                id: cardNode
                                x: 0
                                y: 200
                                visible: true
                                z: -25
                                scale.y: 3
                                scale.x: 2.5

                                property real rotationAngle: 180 //Default to showing back

                                // Front side of the card
                                Model {
                                    id: frontCard
                                    source: "#Rectangle"
                                    receivesShadows: false
                                    castsShadows: false
                                    scale: Qt.vector3d(1, 1, 1) // Adjust dimensions for card thickness
                                    eulerRotation.y: rotationAngle
                                    //visible: rotationAngle >= 0 && rotationAngle <= 90

                                    materials: [
                                        DefaultMaterial {
                                            diffuseMap: Texture {
                                                sourceItem: Image {
                                                    anchors.centerIn: parent
                                                    width: 413
                                                    height: 577
                                                    source: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].imageUrl : ""
                                                    sourceSize: Qt.size(width, height)
                                                    cache: false
                                                }
                                            }
                                        }
                                    ]
                                }

                                // Back side of the card, rotated 180 degrees
                                Model {
                                    id: backCard
                                    source: "#Rectangle"
                                    scale: Qt.vector3d(1, 1, 1)
                                    eulerRotation.y: rotationAngle // Rotated to face the opposite direction
                                    //visible: rotationAngle > 90 && rotationAngle <= 180

                                    materials: [
                                        DefaultMaterial {
                                            diffuseColor: "#ffffff"
                                            diffuseMap: Texture {
                                                sourceItem: Image {
                                                    anchors.centerIn: parent
                                                    width: 413
                                                    height: 577
                                                    source: "cardback.png" // URL for the back image
                                                    sourceSize: Qt.size(width, height)
                                                    cache: false
                                                }
                                            }
                                        }
                                    ]
                                }
                            }

                            MouseArea {
                                id: dragArea
                                anchors.fill: parent
                                property real previousX: 0
                                property real velocityY: 0
                                property real dragSensitivity: 0.2
                                property real momentumDecay: 0.98 // Controls how quickly momentum fades

                                onPressed: {
                                    previousX = mouse.x
                                    velocityY = 0
                                    momentumTimer.stop()
                                    returnToZeroTimer.stop(); // Stop the return to zero timer when dragging
                                }

                                onPositionChanged: {
                                    var deltaX = mouse.x - previousX
                                    velocityY = deltaX * dragSensitivity
                                    cardNode.eulerRotation.y += velocityY
                                    previousX = mouse.x
                                }

                                onReleased: {
                                    momentumTimer.start() // Start applying momentum after release
                                }
                            }

                            // Timer for applying momentum after drag release
                            Timer {
                                id: momentumTimer
                                interval: 16 // About 60 FPS
                                repeat: true
                                onTriggered: {
                                    if (Math.abs(dragArea.velocityY) < 0.1) {
                                        // If the velocity is low, stop the momentum and start returning to zero
                                        momentumTimer.stop();
                                        returnToZeroTimer.start(); // Start the return to zero timer
                                    } else {
                                        cardNode.eulerRotation.y += dragArea.velocityY; // Apply the current velocity
                                        dragArea.velocityY *= dragArea.momentumDecay; // Decay the velocity
                                    }
                                }
                            }

                            // Timer for gradually returning to zero rotation on the Y-axis
                            Timer {
                                id: returnToZeroTimer
                                interval: 16 // About 60 FPS
                                repeat: true
                                onTriggered: {
                                    if (Math.abs(cardNode.eulerRotation.y) < 0.1) {
                                        cardNode.eulerRotation.y = 0; // Set to zero to avoid oscillation
                                        returnToZeroTimer.stop(); // Stop the timer when close enough to zero
                                    } else {
                                        // Gradually reduce the angle towards zero
                                        var returnSpeed = 0.07; // Adjust the return speed to control how quickly it comes to rest
                                        if (cardNode.rotation.y > 0) {
                                            // console.log(cardNode.rotation.y)
                                            //console.log(cardNode.eulerRotation.y)
                                            cardNode.rotation.y -= returnSpeed; // Move back towards 0
                                            if (cardNode.rotation.y < 0) cardNode.rotation.y = 0; // Clamp to zero
                                        } else {
                                            cardNode.rotation.y += returnSpeed; // Move back towards 0
                                            if (cardNode.rotation.y > 0) cardNode.rotation.y = 0; // Clamp to zero
                                        }
                                    }
                                }
                            }

                        }

                        Rectangle {
                            id: rectangle5
                            visible: false
                            color: deepBG
                            border.width: 0
                            anchors.fill: parent
                            z: -1
                        }
                    }



                    clip: true
                }

                bottomPadding: 0
                Layout.margins: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle {
                    id: customDrawer2
                    x: 600
                    width: 274
                    height: 438
                    opacity: 1
                    visible: true
                    color: deepBG
                    radius: 8
                    border.color: "#580a0a"
                    border.width: 7
                    anchors.verticalCenter: parent.verticalCenter
                    z: 0
                    scale: 1
                    // Animate the x position when it changes
                    Behavior on x {
                        NumberAnimation {
                            duration: 500 // Adjust the duration for the desired speed
                            easing.type: Easing.OutQuad // Smooth easing effect
                        }
                    }

                    MouseArea {
                        visible: true
                        anchors.fill: parent
                        anchors.leftMargin: 1
                        anchors.rightMargin: -1
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }

                    clip: true
                    anchors.verticalCenterOffset: 0
                }
            }
        }


        Rectangle {
            id: rectangle6
            height: 70
            opacity: 1
            color: "#00ffffff"
            border.color: "#6c0101"
            border.width: 2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            z: 1

            MySearchFilterTools {
                id: searchFilterTools
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 0
                //toolbarContentHeight: 30
                color: "#00ff0000"
                border.color: "#006c0101"
                border.width: 2
                blockBorderWidth: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                toolsBorderColor: "#ff0000"
                toolsFillColor: deepBG
                mainColor: "#790000"
                z: 2
                Layout.preferredWidth: 500

                // Dynamic ListModel for sets
                setsModel: ListModel {
                    id: setsModel
                }
            }
        }

        Rectangle {
            id: bottomToolbar
            width: 600
            height: 65
            color: "#ee0000"
            border.color: borderColor
            border.width: 2
            z: 1

            Rectangle {
                id: rectangle1
                color: "#541515"
                radius: 8
                border.color: "#ee0000"
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            ComboBox {
                id: setComboBox
                y: 8
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: btnDiscover.left
                //anchors.left: parent.left
                //anchors.right: txtSearchBox.left
                anchors.leftMargin: 25
                anchors.rightMargin: 45
                z: 0
                Layout.leftMargin: 6
                Layout.preferredHeight: -1
                Layout.preferredWidth: -1
                //Layout.fillHeight: false
                //Layout.fillWidth: true
                displayText: "Sets"

                model: setsModel

                delegate: Item {
                    width: parent ? parent.width : 0
                    height: checkDelegate ? checkDelegate.height : 30

                    function toggle() {
                        checkDelegate.toggle()
                    }

                    CheckDelegate {
                        id: checkDelegate
                        anchors.fill: parent
                        text: model.name
                        highlighted: setComboBox.highlightedIndex == index
                        checked: model.selected
                        onCheckedChanged: {
                            if (model.selected !== checked) {
                                model.selected = checked;
                            }
                        }
                    }
                }

                // override space key handling to toggle items when the popup is visible
                Keys.onSpacePressed: {
                    console.log("Space Pressed")
                    if (setComboBox.popup.visible) {
                        var currentItem = setComboBox.popup.contentItem.currentItem
                        if (currentItem) {
                            currentItem.toggle()
                            event.accepted = true
                        }
                    }
                }

                Keys.onReleased: {
                    if (setComboBox.popup.visible)
                        event.accepted = (event.key === Qt.Key_Space)
                }

                Component.onCompleted: {
                    // Request All Sets to populate combo box
                    //console.log("Requesting sets from backend...")
                    backendController.request_sets_retrieve()
                }

                Rectangle {
                    id: rectangle
                    color: "#00ffffff"
                    radius: 8
                    border.color: "#ce0000"
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }
            }

            Connections {
                target: backendController

                function onSetsResults(response) {
                    var data = JSON.parse(response)
                    setsModel.clear(
                                ) // Clear existing items in the model

                    if (data.error) {
                        sets = [] // Clear the array of sets
                        console.log("Error in the data received from backend.")
                    } else {
                        // Collect sets into an array
                        var tempSets = []

                        data.forEach(function (set) {
                            // Collect each set object
                            tempSets.push({
                                              "name": set.name,
                                              "selected": false
                                          })
                        })

                        // Sort the array alphabetically by name
                        tempSets.sort(function (a, b) {
                            return a.name.localeCompare(
                                        b.name) // Sort using localeCompare for proper alphabetical order
                        })

                        // Append sorted sets to the model
                        tempSets.forEach(
                                    function (sortedSet) {
                                        setsModel.append(
                                                    sortedSet)
                                        //console.log("Appending set: ", sortedSet.name); // Debugging each appended set
                                    })

                        //console.log("SetsModel updated with new sets: ", setsModel.count); // Check the number of elements
                    }
                }
            }

            Button {
                id: btnDiscover
                x: 295
                y: 8
                width: 125
                height: 35
                text: qsTr("Discover")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: toggleBothButton.left
                anchors.rightMargin: 52
                anchors.verticalCenterOffset: 0
                //   anchors.right: parent.right
                //  anchors.rightMargin: -585
                z: 1
                font.styleName: "Bold Italic"
                // Layout.fillHeight: false
                // Layout.rightMargin: 6
                //Layout.fillWidth: false
                palette {
                    button: "blue"
                }

                Rectangle {
                    id: rectangle7
                    x: -304
                    y: -18
                    color: "#00ffffff"
                    radius: 8
                    border.color: "#ce0000"
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Discover a Pokemon")

                // Change scale when hovered
                scale: hovered ? 1.05 : 1.0

                onClicked: {
                    // Initialize an empty array for the search parameters
                    var searchParams = []

                    var setsParams = [];
                    // Collecting selected items from the ComboBox
                    for (var i = 0; i < setsModel.count; i++) {
                        var item = setsModel.get(i)
                        if (item.selected) {
                            // Build the tuple for each selected set item
                            setsParams.push(
                                        ['set', 'name', item.name])
                        }
                    }

                    if(setsParams.length === 0) {
                        for (var setIdx = 0; setIdx < setsModel.count; setIdx++) {
                            var setItem = setsModel.get(setIdx)
                            setsParams.push(
                                        ['set', 'name', setItem.name])

                        }
                    }

                    var typesParams = [];
                    // Check the state of each Pokémon TCG type button and add to search parameters if checked
                    if (searchFilterTools.fireChecked) {
                        typesParams.push(
                                    ['types', '', 'fire'])
                    }
                    if (searchFilterTools.waterChecked) {
                        typesParams.push(
                                    ['types', '', 'water'])
                    }
                    if (searchFilterTools.grassChecked) {
                        typesParams.push(
                                    ['types', '', 'grass'])
                    }
                    if (searchFilterTools.lightningChecked) {
                        typesParams.push(
                                    ['types', '', 'lightning'])
                    }
                    if (searchFilterTools.psychicChecked) {
                        typesParams.push(
                                    ['types', '', 'psychic'])
                    }
                    if (searchFilterTools.fightingChecked) {
                        typesParams.push(
                                    ['types', '', 'fighting'])
                    }
                    if (searchFilterTools.darknessChecked) {
                        typesParams.push(
                                    ['types', '', 'darkness'])
                    }
                    if (searchFilterTools.fairyChecked) {
                        typesParams.push(
                                    ['types', '', 'fairy'])
                    }
                    if (searchFilterTools.dragonChecked) {
                        typesParams.push(
                                    ['types', '', 'dragon'])
                    }
                    if (searchFilterTools.metalChecked) {
                        typesParams.push(
                                    ['types', '', 'metal'])
                    }
                    if (searchFilterTools.colorlessChecked) {
                        typesParams.push(
                                    ['types', '', 'colorless'])
                    }

                    if(typesParams.length === 0) {
                        typesParams.push(['types', '', 'fire']);
                        typesParams.push(['types', '', 'grass']);
                        typesParams.push(['types', '', 'water']);
                        typesParams.push(['types', '', 'lightning']);
                        typesParams.push(['types', '', 'fighting']);
                        typesParams.push(['types', '', 'psychic']);
                        typesParams.push(['types', '', 'darkness']);
                        typesParams.push(['types', '', 'metal']);
                        typesParams.push(['types', '', 'fairy']);
                        typesParams.push(['types', '', 'dragon']);
                        typesParams.push(['types', '', 'colorless']);
                    }

                    // console.log(setsParams);
                    // console.log(typesParams)

                    searchParams = searchParams.concat(typesParams);
                    searchParams = searchParams.concat(setsParams);

                    //console.log(searchParams)


                    // Call the request_search function with the built tuples if there are any
                    if (searchParams.length > 0) {
                        //Print each tuple as a string to the console
                        for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
                            var tupleString = "[" + searchParams[paramIndex][0] + ", "
                                    + searchParams[paramIndex][1] + ", "
                                    + searchParams[paramIndex][2] + "]"
                        }
                        backendController.request_discover(
                                    searchParams)
                        // resetLeftColumnScroll()
                        // resetRightColumnScroll()
                    }
                }

                Connections {
                    target: btnDiscover
                    function onPressed() {
                        rectangle7.border.color = pressedToggleColor;
                    }
                }

                Connections {
                    target: btnDiscover
                    function onReleased(){
                        rectangle7.border.color = releasedToggleColor;
                    }
                }
            }

            Image {
                id: ballToggleImage
                x: 493
                y: -17
                width: 100
                height: 100
                opacity: 1
                source: "https://cdn-icons-png.flaticon.com/512/188/188931.png"
                z: 1
                scale: 0.45
                fillMode: Image.PreserveAspectFit
            }

            Timer {
                id: toggleLockTimer
                interval: lockTimerDuration
                repeat: false
                onTriggered: {
                    // console.log("Toggle Timer Triggered");
                    // toggleBothButton.enabled = true;
                    // toggleBothButton.hoverEnabled = true;

                }
            }

            RoundButton {
                id: toggleBothButton
                x: 531
                width: 40
                height: 40
                opacity: 0
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 37
                enabled: !toggleLockTimer.running
                //enabled: !toggleLockTimer.running
                highlighted: false
                flat: false
                anchors.verticalCenterOffset: 0
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Add to Collection")

                MouseArea {
                    visible: false
                    anchors.fill: parent
                    enabled: true
                    preventStealing: false
                    propagateComposedEvents: false
                    hoverEnabled: false
                    cursorShape: Qt.PointingHandCursor
                    drag.target: toggleBothButton
                    onEntered: ballToggleImage.scale = 0.40;
                    onExited: ballToggleImage.scale = 0.35;
                }

                Connections {
                    target: toggleBothButton
                    function onClicked() {
                        // console.log("clicked")

                    }

                }

                Rectangle {
                    id: toggleButtonHighlight
                    x: -539
                    y: -557
                    color: "#00ffffff"
                    radius: 20
                    border.color: "#ff0000"
                    border.width: 30
                    anchors.fill: parent
                    anchors.leftMargin: -4
                    anchors.rightMargin: -4
                    anchors.topMargin: -4
                    anchors.bottomMargin: -4
                }
            }
        }
    }

    Connections {
        target: backendController
        function onDiscoverResults(response) {

            var data = JSON.parse(response)

            if (data.error) {
                console.log("Error in response:",
                            data.error) // Log the error message
                cards = []
            } else {
                cards = data.map(card => ({
                                              "name": card.name,
                                              "id": card.id,

                                              // Card Scan Image Hi-Res
                                              "imageUrl": card.imageUrl
                                                          || "",

                                              "set": card.set,

                                          }))

                selectedIndex = 0; // Start with the first card
                view.visible = true
            }
        }
    }

    Rectangle {
        id: rectangle14
        color: blockBG
        anchors.fill: parent
        z: 0
        border.color: borderColor
    }

    Item {
        id: __materialLibrary__
    }
    // Page content for browsePage
}




/*##^##
Designer {
    D{i:0}D{i:41;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/

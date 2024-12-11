import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Item {
    id: collectionPage
    width: 600
    height: 600

    // Rectangle with color "#541515" as the background of the page
    Rectangle {
        width: parent.width
        height: parent.height
        color: "#541515"  // Set the color to the desired shade
        anchors.fill: parent  // Make this rectangle fill the entire page
        z: -1  // Ensure this rectangle is behind other elements
    }

    // Model for the collection of saved cards
    ListModel {
        id: savedCardsModel
        // Sample data, you will append cards dynamically
        ListElement { name: ""; image: "cardback.png" }
        ListElement { name: ""; image: "cardback.png" }
        ListElement { name: ""; image: "cardback.png" }
       // ListElement { name: ""; image: "cardback.png" }
       // ListElement { name: ""; image: "cardback.png" }
       // ListElement { name: ""; image: "cardback.png" }
        // Add more cards as needed
    }

    // GridLayout for arranging cards in a grid
    GridLayout {
        id: gridLayout
        width: parent.width
        height: parent.height
        columns: 3  // Define how many cards per row
        rowSpacing: 5  // Optional: add some spacing between rows
        columnSpacing: 5  // Optional: add some spacing between columns

        // Repeater to dynamically create cards based on the model
        Repeater {
            model: savedCardsModel

            Item {
                width: (parent.width - 20) / 3  // Adjust width per card with some margin
                height: 300  // Height is fixed, or you can adjust this dynamically

                Rectangle {
                    width: parent.width
                    height: 290  // Adjusted height
                    color: "#02d20b"
                    radius: 5
                    border.color: "#FF0000"
                    border.width: 2

                    // Image for each card
                    Image {
                        source: model.image // Dynamically use the image from the model
                        width: parent.width // Resize image based on the card's width
                        height: parent.height // Resize image based on the card's height
                        anchors.centerIn: parent  // Center the image inside the rectangle
                        fillMode: Image.PreserveAspectCrop
                    }

                    // Name for each card
                    Text {
                        text: model.name  // Dynamically use the name from the model
                        anchors.left: parent.left
                        anchors.leftMargin: 90
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }
            }
        }
    }

    // Button for adding a card to the collection (as an example)
    Button {
        text: "Add Card"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            // Add a new card to the model dynamically
            savedCardsModel.append({
                "name": "",
                "image": "cardback.png"
            });
            console.log("New card added to collection.");
        }
    }
}

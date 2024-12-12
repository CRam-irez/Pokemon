from PySide6.QtCore import QObject, Slot, Signal
import json

class CollectionHandler(QObject):
    # Signal to notify QML when a new card is added
    cardAdded = Signal(str, str)  # Emits card name and image URL

    def __init__(self):
        super().__init__()
        # This holds the collection in memory (optional)
        self.collection = []

    @Slot(str)
    def processCardInfo(self, card_info_json):
        """
        Process the card information received from QML.
        card_info_json: A JSON string containing card details (name, image, etc.)
        """
        try:
            # Parse the JSON string to a Python dictionary
            card_info = json.loads(card_info_json)
            name = card_info.get("name", "Unknown Card")
            image = card_info.get("imageUrl", "default_image.png")

            # Print the card information
            print(f"Card added to collection: Name = {name}, Image = {image}")

            # Optionally, add to an internal collection
            self.collection.append(card_info)

            # Emit the signal to notify QML about the new card
            self.cardAdded.emit(name, image)

        except json.JSONDecodeError:
            print("Error: Invalid JSON received from QML")

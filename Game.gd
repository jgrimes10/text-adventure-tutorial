extends Control


# Get a copy of the InputResponse scene so we can make copies of it
# whenever text is input to show in the GameInfo
const InputResponse = preload("res://InputResponse.tscn")

# Grab the history_rows node so we can make the new InputReponse
# scenes children of it
onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows


func _on_Input_text_entered(new_text: String) -> void:
	# Create an instance of the InputResponse scene when
	# text is entered
	var input_response = InputResponse.instance()
	# Set the text for the newly created input_response to show in the GameInfo
	input_response.set_text(new_text, "This is what the game will respond with.")
	# Add the InputResponse as a child of the history_rows node
	history_rows.add_child(input_response)

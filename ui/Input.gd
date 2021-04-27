extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the focus to the text input box when the scene starts
	# so the player can type without have to click into the box
	grab_focus()


func _on_Input_text_entered(_new_text: String) -> void:
	# TODO: If desired, in the future, store the previous commands and
	# allow the player to cycle through them for quick inputs

	# When the user presses enter, clear the input field
	clear()

extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the focus to the text input box when the scene starts
	# so the player can type without have to click into the box
	grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

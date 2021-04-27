extends VBoxContainer


func set_text(input: String, response: String) -> void:
	$InputHistory.text = " > " + input
	$Response.text = response

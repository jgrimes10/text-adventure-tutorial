extends Control


# Get a copy of the InputResponse scene so we can make copies of it
# whenever text is input to show in the GameInfo
const InputResponse = preload("res://InputResponse.tscn")

# The maximum amount of previous entries that will be remembered
# before the game starts "forgetting" the older lines
export (int) var max_lines_remembered := 30

# Grab the history_rows node so we can make the new InputReponse
# scenes children of it
onready var history_rows = $Background/MarginContainer/Rows/GameInfo/Scroll/HistoryRows
# Grab the scroll node so we can grab the v_scrollbar on it
onready var scroll = $Background/MarginContainer/Rows/GameInfo/Scroll
# Grab the v_scrollbar so we can scroll down to the bottom when new input is sent
onready var scrollbar = scroll.get_v_scrollbar()

var max_scroll_length := 0         # The current length of the ScrollContainer


func _ready() -> void:
	# Connect to the changed event on the vertical scrollbar
	scrollbar.connect("changed", self, "handle_scrollbar_changed")
	# Set the max_scroll_length to its current max value
	max_scroll_length = scrollbar.max_value


func handle_scrollbar_changed() -> void:
	# Check if the length of the scrollbar has changed
	if max_scroll_length != scrollbar.max_value:
		# Update the max_scroll_length to match
		max_scroll_length = scrollbar.max_value
		# Scroll all the way to the bottom of the ScrollContainer
		scroll.scroll_vertical = max_scroll_length


func _on_Input_text_entered(new_text: String) -> void:
	# Check to make sure there was text entered and it isn't an
	# empty string, if it is empty, return and do nothing
	if new_text.empty():
		return
	# Create an instance of the InputResponse scene when
	# text is entered
	var input_response = InputResponse.instance()
	# Set the text for the newly created input_response to show in the GameInfo
	input_response.set_text(new_text, "This is what the game will respond with.")
	# Add the InputResponse as a child of the history_rows node
	history_rows.add_child(input_response)
	
	# Check if there are more rows than the maximum amount of rows allowed
	if history_rows.get_child_count() > max_lines_remembered:
		# Figure out the number of rows over the maximum allowed
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		# Loop the amount of times equal to the number over
		# the maximum allowed
		for _i in range(rows_to_forget):
			# Delete the oldest row
			history_rows.get_child(0).queue_free()

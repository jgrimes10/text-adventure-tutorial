extends Node


signal response_generated(response_text)

# The room the player is currently in
var current_room: Room = null


func initialize(starting_room: Room) -> void:
	change_room(starting_room)


func process_command(input: String) -> String:
	# Split up the input into separate words
	var words = input.split(" ", false, 0)
	# If there are no words:
	if words.size() == 0:
		return "Error: no words were parsed."
	
	# Get the first word
	var first_word = words[0].to_lower()
	var second_word = ""
	# If there are at least two words
	if words.size() > 1:
		second_word = words[1].to_lower()

	match first_word:
		"go":
			return go(second_word)
		"help":
			return help()
		_:
			return "Unrecognized command - please try again."


func go(second_word: String) -> String:
	# If the second word is an empty string, error
	if second_word.empty():
		return "Go where?"
	return "You go %s" % second_word


func help() -> String:
	return "You can use these commands: go [location], help"


func change_room(new_room: Room) -> void:
	# Update the current_room variable to keep track of where the player is
	current_room = new_room
	# Create a variable to hold all of the responses to join together
	var strings = PoolStringArray([
		"You are now in: " + new_room.room_name + ". It is " + new_room.room_description,
		"Exits: "
	]).join("\n")
	emit_signal("response_generated", strings)

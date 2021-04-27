extends Node


# The room the player is currently in
var current_room: Room = null


func initialize(starting_room: Room) -> String:
	return change_room(starting_room)


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
	
	# If the second word is a valid exit to the current room
	if current_room.exits.keys().has(second_word):
		var exit = current_room.exits[second_word]
		# Change to the new room in that direction
		var change_response = change_room(exit.get_other_room(current_room))
		return PoolStringArray(["You go %s." % second_word, change_response]).join("\n")
	# There is no exit in that direction
	else:
		return "This room has no exits in that direction."
	


func help() -> String:
	return "You can use these commands: go [location], help"


func change_room(new_room: Room) -> String:
	# Update the current_room variable to keep track of where the player is
	current_room = new_room
	var exit_string = PoolStringArray(new_room.exits.keys()).join(" ")
	# Create a variable to hold all of the responses to join together
	var strings = PoolStringArray([
		"You are now in: " + new_room.room_name + ". It is " + new_room.room_description,
		"Exits: " + exit_string
	]).join("\n")
	return strings

extends Node


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

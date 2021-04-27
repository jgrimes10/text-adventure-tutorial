extends Resource
class_name Exit


var room_1 = null                        # The room on the other end of the exit from room_2
var room_1_is_locked: bool = false       # If this exit can currently be used to enter room_1

var room_2 = null                        # The room on the other end of the exit from room_1
var room_2_is_locked: bool = false       # If this exit can currently be used to enter room_2


# This function cannot be staticly typed due to circular dependencies :(
func get_other_room(current_room):
	# If the room you are in is room_1
	if current_room == room_1:
		return room_2
	# Else if the room you are in is room_2
	elif current_room == room_2:
		return room_1
		pass
	# The room you are in is not attached to this exit
	# This should never happen, but just in case...
	else:
		printerr("The room you tried to find is not connected to this exit.")
		return null

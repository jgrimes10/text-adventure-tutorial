tool # Make this script run in the editor
extends PanelContainer
class_name Room


export (String) var room_name = "Room Name" setget set_room_name
export (String, MULTILINE) var room_description = "This is the description of the room" setget set_room_description

var exits: Dictionary = {}          # A dictionary of the exits out of the room


func set_room_name(new_name: String) -> void:
	# Set the text in the editor to the room_name
	$MarginContainer/Rows/RoomName.text = new_name
	# Set the actual variable for room_name to the new_name
	room_name = new_name


func set_room_description(new_description: String) -> void:
	# Set the text in the editor to the room_description
	$MarginContainer/Rows/RoomDescription.text = new_description
	# Set the actual variable for the room_description to the new_description
	room_description = new_description


func connect_exit(direction: String, room_to_connect: Room) -> void:
	match direction:
		"north":
			exits[direction] = room_to_connect
			room_to_connect.exits["south"] = self
		"east":
			exits[direction] = room_to_connect
			room_to_connect.exits["west"] = self
		"south":
			exits[direction] = room_to_connect
			room_to_connect.exits["north"] = self
		"west":
			exits[direction] = room_to_connect
			room_to_connect.exits["east"] = self
		_:
			printerr("Tried to connect invalid direction: %s", direction)
		

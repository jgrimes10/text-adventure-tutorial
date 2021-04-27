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
	# Create a new exit resource
	var exit = Exit.new()
	# Set room_1 to the room doing the connecting
	exit.room_1 = self
	# Set room_2 to the room being connected to
	exit.room_2 = room_to_connect
	# Set the exit resource to the correct direction
	exits[direction] = exit
	# Connect the reverse direction of the next room back to this room
	# using the same exit resource object
	match direction:
		"north":
			room_to_connect.exits["south"] = exit
		"east":
			room_to_connect.exits["west"] = exit
		"south":
			room_to_connect.exits["north"] = exit
		"west":
			room_to_connect.exits["east"] = exit
		_:
			printerr("Tried to connect invalid direction: %s", direction)
		

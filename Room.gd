extends PanelContainer
class_name Room


export (String) var room_name = "Room Name"
export (String) var room_description = "This is the description of the room"

var exits: Dictionary = {}          # A dictionary of the exits out of the room


func connect_exit(direction: String, room_to_connect: Room) -> void:
	print("Current room ", room_name)
	print("Target room ", room_to_connect.room_name)
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
		

extends Resource


export (String) var item_name := "Item Name"     # The name of the item
# The type of item (resource, consumable, equipment, etc.)
export (Types.ItemTypes) var item_type := Types.ItemTypes.KEY

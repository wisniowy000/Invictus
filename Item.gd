extends CSGCylinder3D

@export var ITEM_NAME = ""

func collect():
	Inventory.add_item(ITEM_NAME)
	queue_free()

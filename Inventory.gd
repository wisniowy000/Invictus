extends Node

var INVENTORY = {}

func add_item(_name, quantity:int = 1):
	if INVENTORY.has(_name):
		INVENTORY[_name] += quantity
	else:
		INVENTORY[_name] = quantity
	print(INVENTORY)

func remove_item(_name, quantity:int):
	if INVENTORY.has(_name):
		INVENTORY[_name] -= quantity
		if INVENTORY[_name] <= 0:
			INVENTORY.erase(_name)

extends StaticBody3D

@export var HP = 3
@export var dropped_item:PackedScene
@export var item_count = 4

func take_damage(amount=1):
	HP -= amount
	if HP <= 0:
		drop_item()
		queue_free()

func drop_item():
	for i in range(item_count):
		var item = dropped_item.instantiate()
		get_parent().add_child(item)
		var offset = Vector3(randf(),randf(),randf())
		item.global_position = global_position + offset

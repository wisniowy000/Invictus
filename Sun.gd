extends Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var percent = 0
	if WorldTime.minutes != 0:
		percent = WorldTime.minutes / WorldTime.FULLDAYCYCLE
		rotation_degrees.x = lerp(rotation_degrees.x, 360 * percent, delta)

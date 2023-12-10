extends Node3D

@onready var ray = %Interact
@onready var anims = %ToolAnimations

const AXE = 1
var active_tool = AXE
var can_use_tool = true

func use_active_tool():
	if not can_use_tool:
		return
	var obj = ray.get_collider()
	match active_tool:
		AXE:
			anims.play("Axe_Swing")
			if obj:
				if obj.is_in_group("Tree"):
					obj.take_damage()

func set_can_use_tool(use_tool:bool):
	can_use_tool = use_tool

func select_tool(tool_id):
	can_use_tool = true

extends CharacterBody3D

@export var SPEED = 6
@export var JUMP_VELOCITY = 10
@export var LOOK_SPEED = 20

@onready var cam = $View

var mouse_input = Vector2()
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _physics_process(delta):
	var input = Input.get_vector("left","right","down","up")
	velocity = global_transform.basis.x * input.x * SPEED
	velocity -= global_transform.basis.z * input.y * SPEED
	
	rotation_degrees.y -= LOOK_SPEED * mouse_input.x * delta
	cam.rotation_degrees.x -= LOOK_SPEED * mouse_input.y * delta
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x,-80,80)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("pause"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	mouse_input = Vector2()
	
	if Input.is_action_just_pressed("interact"):
		interact()
	
func interact():
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_input = event.relative
		
	
	

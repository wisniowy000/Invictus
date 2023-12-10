extends CharacterBody3D

@export var SPEED = 6
@export var JUMP_VELOCITY = 10
@export var LOOK_SPEED = 20
@export var GRAVITY = 9.81

@onready var cam = $View
@onready var ray = %Interact
@onready var tools = %Tools

var mouse_input = Vector2()
var y_velocity = Vector3()
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _physics_process(delta):
	# Movement
	var input = Input.get_vector("left","right","down","up")
	velocity = global_transform.basis.x * input.x * SPEED
	velocity -= global_transform.basis.z * input.y * SPEED
	
	# Gravity and Jump
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			y_velocity.y = JUMP_VELOCITY
	else:
		y_velocity.y -= GRAVITY * delta
	velocity += y_velocity
	
	# Camera Rotation
	rotation_degrees.y -= LOOK_SPEED * mouse_input.x * delta
	cam.rotation_degrees.x -= LOOK_SPEED * mouse_input.y * delta
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x,-80,80)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("use"):
		use_item()
	
	# Pause
	if Input.is_action_just_pressed("pause"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	mouse_input = Vector2()
	
	# Interact
	if Input.is_action_just_pressed("interact"):
		interact()
	
func interact():
	var obj = ray.get_collider()
	
	if obj:
		if obj.has_method("collect"):
			obj.collect()
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_input = event.relative

func use_item():
	tools.use_active_tool()

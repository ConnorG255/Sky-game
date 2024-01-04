extends CharacterBody3D

const cspeed = 5
var SPEED = 5.0
const JUMP_VELOCITY = 4.5
const sense = 0.003
const boost = 1.5






func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		

func _physics_process(delta):
	#if not is_on_floor():
	#	velocity.y -= gravity * delta


	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_dir = Input.get_vector("A", "D", "W", "S")
	var direction = (Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = -direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(-velocity.y, 0, SPEED)

	move_and_slide()

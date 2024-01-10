extends CharacterBody3D

const cspeed = 5
var SPEED = 10.0
const JUMP_VELOCITY = 4.5
const sense = 0.003
const boost = 1.5

var rotspeed = 5
var rotmultiplier = 0.1

var pi = 3.14159




func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _process(delta):
	Global.main = true
	
	if(global_position.z != -4.5):
		Global.end = true
		Spawnerboi.ospeed = 0

func _physics_process(delta):
	#getRot()
	#if not is_on_floor():
	#	velocity.y -= gravity * delta
	
	"""
	# Have to redo for border, not optimal :(
	if(Input.is_action_pressed("A")):
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if(Input.is_action_pressed("D")):
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if(Input.is_action_pressed("W")):
		velocity.y = SPEED
	elif(Input.is_action_pressed("S")):
		velocity.y = -SPEED"""
	
	
	var input_dir = Input.get_vector("A", "D", "W", "S")
	
	var direction = (Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	if direction and not Global.paused:
		velocity.x = direction.x * SPEED
		velocity.y = -direction.y * SPEED
	else: 
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(-velocity.y, 0, SPEED)
	
	var screen_size = get_window().size
	position.x = clamp(position.x, -8, 8)
	position.y = clamp(position.y, -4.25, 4.25)

	move_and_slide()
	
	# rotating tot get the infinite spin
	
	rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, 0), delta * rotspeed)
	rotation.y *= 0.9
	rotation.x = lerp_angle(rotation.x, atan2(velocity.y * rotmultiplier, 0), delta * rotspeed)
	rotation.x *= 0.9
	rotation.z = lerp_angle(rotation.z, atan2(-velocity.x * rotmultiplier, 0), delta * rotspeed)
	rotation.z *= 0.9



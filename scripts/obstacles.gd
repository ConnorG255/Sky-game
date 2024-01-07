extends Node3D

var canscore:bool = true
func _ready():
	pass

func _process(delta):
	position.z += Spawnerboi.ospeed
	#player position
	if(position.z >= -4.5) and canscore:
		Global.score += 1
		canscore = false
		await(get_tree().create_timer(1).timeout)
		queue_free()
		
	
		
	pass

extends Node3D

var canscore:bool = true
func _ready():
	pass

func _process(delta):
	position.z += Spawnerboi.ospeed
	#player position
	if(position.z >= -4.5) and canscore:
		Global.score += 1
		Spawnerboi.ospeed += 0.001
		canscore = false
		await(get_tree().create_timer(1).timeout)
		queue_free()
		
	if Global.end:
		queue_free()
		
	pass

extends Node3D

var obstacles: Array = []
@export_dir var opath = "res://prefabs/obstacles/"

@export var timebetween = 5
@export var ospeed = 0.02


var canspawn:bool = true

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	loadobstacles(opath)
	pass 


#i dont know if its good or not to be declaring the types but might as well starting now
func loadobstacles(path: String) -> void:

	var dir = DirAccess.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			obstacles.append(path + file)

	dir.list_dir_end()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	spawning()

	pass

#Spawing in the walls with the speed of tahe walls and the 
#rate at which they spawn being changed through the player getting points
#in a different script
func spawning() -> void:
	if(canspawn && !Global.paused):
		canspawn = false
		var randomnum = randi() % 4
		var ob = load(obstacles[randomnum])
		print(randomnum)
		var newob = ob.instantiate()
		newob.position = Vector3(0,0,-180)
		newob.rotation = Vector3.ZERO
		get_tree().get_root().call_deferred("add_child", newob)
		canspawn = false
		await(get_tree().create_timer(timebetween).timeout)
		canspawn = true


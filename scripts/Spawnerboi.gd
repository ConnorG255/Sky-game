extends Node

var obstacles: Array = []
@export_dir var opath = "res://prefabs/obstacles/"

# Called when the node enters the scene tree for the first time.
func _ready():
	loadobstacles(opath)
	print(obstacles)
	pass 

func loadobstacles(path) -> void:

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
	pass

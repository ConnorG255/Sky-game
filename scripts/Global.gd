extends Node


@export var score = 0
@export var end:bool = false
@export var canend:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if end and canend:
		canend = false
		get_tree().change_scene_to_file("res://prefabs/Endscreen.tscn")
	

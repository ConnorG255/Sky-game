extends Node


@export var score = 0
@export var end:bool = false
@export var canend:bool = true
@export var paused:bool = false
@export var main:bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if end and canend:
		canend = false
		get_tree().change_scene_to_file("res://prefabs/Endscreen.tscn")
		
	if(Input.is_action_pressed("ui_cancel") && Global.main == true):
		var ui = $"../Main/ui"
		var pause = $"../Main/Pause"
		ui.hide()
		pause.show()
		Spawnerboi.ospeed = 0
		paused = true
		
	


func _on_unpause_pressed():
	pass # Replace with function body.



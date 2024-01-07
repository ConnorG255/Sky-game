extends Control

@onready var score = $PanelContainer/MarginContainer/VBoxContainer/Score

func _on_restart_pressed():
	Global.end = false
	Global.score = 0
	Spawnerboi.ospeed = 0.02
	Global.canend = true
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
	
func _process(delta):
	
	score.text = str(Global.score)

extends Control

@onready var score = $PanelContainer/MarginContainer/VBoxContainer/Score
@onready var high_score = $PanelContainer/MarginContainer/VBoxContainer/HighScore

const save = "user://savefile.save"
func _ready():
	if(gethscore() < Global.score):
		setscore()
	
	
	
func setscore():
	var file = FileAccess.open(save, FileAccess.WRITE_READ)
	file.store_32(Global.score)
	
func _on_restart_pressed():
	Global.end = false
	Global.score = 0
	Spawnerboi.ospeed = 0.02
	
	Global.canend = true
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
	
func _process(delta):
	Global.main = false
	score.text = "Score: " + str(Global.score)
	high_score.text = "Highscore: " + str(gethscore())
	


func gethscore():
	var file = FileAccess.open(save, FileAccess.READ)
	var hscore = 0
	if FileAccess.file_exists(save):
		hscore = file.get_32()
	return hscore
	

func _on_home_pressed():
	
	get_tree().change_scene_to_file("res://prefabs/StartScreen.tscn")
	pass # Replace with function body.

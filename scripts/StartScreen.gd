extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.main = false
	pass # Replace with function body.





func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	Spawnerboi.ospeed = 0.02 + Global.score * 0.003
	Global.paused = false
	Global.score = 0
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

extends Control


@onready var ui = $"../ui"

func _on_unpause_pressed():
	hide()
	ui.show()
	Spawnerboi.ospeed = 0.02 + Global.score * 0.003
	Global.paused = false
	pass # Replace with function body.



func _on_home_pressed():
	
	pass # Replace with function body.

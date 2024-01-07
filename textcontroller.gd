extends Control

# Not just text controller but alos does stuff with score 

@onready var scoretext = $Scoretext

func _process(delta):
	scoretext.text = "Score: " + str(Global.score)
	pass

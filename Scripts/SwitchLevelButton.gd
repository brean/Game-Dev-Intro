extends Button

export var level:String = "Main"

# Button has been pressed
func _pressed():
	get_tree().change_scene("res://Scenes/" + level + ".tscn")

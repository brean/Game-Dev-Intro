extends Area2D

export var level_name: String = "Main"

func _ready():
	self.connect("body_entered",self,"body_entered")

func body_entered(coll):
	var groups = coll.get_groups()
	if (groups.has("player")):
		get_tree().change_scene("res://Scenes/" + level_name + ".tscn")

extends Area2D

func _ready():
	self.connect("body_entered",self,"body_entered")

func body_entered(coll):
	print(coll)
	var groups = coll.get_groups()
	if (groups.has("player")):
		get_node("../goal_line").visible = false
		get_node("../goal_line_walked_front").visible = true
		get_node("../goal_line_walked_back").visible = true

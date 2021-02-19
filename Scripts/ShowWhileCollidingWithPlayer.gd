extends Area2D

export var player_group: String = "player"
export var node_path: String = ""

func _ready():
	if node_path != "":
		self.connect("body_entered",self,"body_entered")
		self.connect("body_exited",self,"body_exited")
		get_node(node_path).visible = false

func body_entered(coll):
	var groups = coll.get_groups()
	if (groups.has(player_group)):
		get_node(node_path).visible = true
		
func body_exited(coll):
	var groups = coll.get_groups()
	if (groups.has(player_group)):
		get_node(node_path).visible = false

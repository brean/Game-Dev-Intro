extends Area2D

export var player_group: String = "player"
export var node_path: String = "../../Ground"
var ground_node;

func _ready():
	if node_path != "":
		self.connect("body_entered",self,"body_entered")
		ground_node = get_node(node_path)

func body_entered(coll):
	var groups = coll.get_groups()
	if (groups.has(player_group)):
		ground_node.get_parent().remove_child(ground_node)
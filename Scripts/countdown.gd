extends Node2D
var timeout = 120


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeout -= delta
	var timeout_minutes = floor(timeout / 60)
	var txt = " "
	if timeout_minutes < 10:
		txt += "0"
	txt += str(timeout_minutes) + ":"
	var timeout_seconds = int(timeout) % 60
	if timeout_seconds < 10:
		txt += "0"
	get_node("TimerLabel").text = txt + str(timeout_seconds)
	# TimerLabel -> change text
